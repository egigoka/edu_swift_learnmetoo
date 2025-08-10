//
//  NetworkManager.swift
//  ReqResApp
//
//  Created by egigoka on 10.08.2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case decodingError
    case noData
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchAvatar(from url: URL, completion: @escaping (Data) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                completion(imageData)
            }
        }
    }
    
    private func getRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue("reqres-free-v1", forHTTPHeaderField: "x-api-key")
        return request
    }
    
    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        
        let request = getRequest(url: Link.allUsers.url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("response status code: \(response.statusCode)")
            }
            
            guard let data else {
                print(error ?? "No error description")
                sendFailure(with: .noData)
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let usersQuery = try decoder.decode(UsersQuery.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(usersQuery.data))
                }
            } catch {
                print(String(data: data, encoding: .utf8) ?? "")
                sendFailure(with: .decodingError)
            }
            
            func sendFailure(with error: NetworkError) {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
        }.resume()
    }
}

// MARK: - Link
extension NetworkManager {
    enum Link {
        case allUsers
        
        var url: URL {
            switch self {
            case .allUsers:
                return URL(string: "https://reqres.in/api/users")!
            }
        }
    }
}
