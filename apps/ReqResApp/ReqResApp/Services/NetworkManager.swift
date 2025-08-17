//
//  NetworkManager.swift
//  ReqResApp
//
//  Created by egigoka on 10.08.2025.
//

import Foundation
import Alamofire

enum NetworkErrorNative: Error {
    case decodingError
    case noData
    case noUsers
    case deletingError
    
    var title: String {
        switch self {
        case .decodingError:
            return "Can't decode received data"
        case .noData:
            return "Can't fetch data at all"
        case .noUsers:
            return "No users got from API"
        case .deletingError:
            return "Can't delete user"
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchAvatarNative(from url: URL, completion: @escaping (Data) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                completion(imageData)
            }
        }
    }
    
    private func getRequestNative(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue("reqres-free-v1", forHTTPHeaderField: "x-api-key")
        return request
    }
    
    func fetchUsersNative(completion: @escaping (Result<[User], NetworkErrorNative>) -> Void) {
        
        let request = getRequestNative(url: Link.allUsers.url)
        //let request = getRequest(url: Link.withNoData.url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data, let response = response as? HTTPURLResponse else {
                print(error?.localizedDescription ?? "No error description")
                sendFailure(with: .noData)
                return
            }
            
            if (200...299).contains(response.statusCode) {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let usersQuery = try decoder.decode(UsersQuery.self, from: data)
                    DispatchQueue.main.async {
                        if usersQuery.data.count == 0 {
                            sendFailure(with: .noUsers)
                            return
                        }
                        completion(.success(usersQuery.data))
                    }
                } catch {
                    print(String(data: data, encoding: .utf8) ?? "")
                    sendFailure(with: .decodingError)
                }
            }
            
            func sendFailure(with error: NetworkErrorNative) {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
            
        }.resume()
    }
    
    func postUserNative(_ user: User, completion: @escaping (Result<PostUserQuery, NetworkErrorNative>) -> Void) {
        
        var request = getRequestNative(url: Link.singleUser.url)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let userQuery = PostUserQuery(
            firstName: user.firstName,
            lastName: user.lastName
        )
        
        let jsonData = try? JSONEncoder().encode(userQuery)
        
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data else { return }
            
            if let postUserQuery = try? JSONDecoder().decode(PostUserQuery.self, from: data) {
                DispatchQueue.main.async {
                    completion(.success(postUserQuery))
                }
            } else {
                print(String(data: data, encoding: .utf8) ?? "no data")
                completion(.failure(.decodingError))
            }
        }.resume()
        
    }
    
    func deleteUserNative(_ id: Int, completion: @escaping (Bool) -> Void) {
        let userURL = Link.singleUser.url.appending(component: "\(id)")
        var request = getRequestNative(url: userURL)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            guard let response = response as? HTTPURLResponse else {
                completion(false)
                return
            }
            DispatchQueue.main.async {
                completion(response.statusCode == 204)
            }
        }.resume()
        
    }
    
    func deleteUserWithIdNative(_ id: Int) async throws -> Bool {
        let userURL = Link.singleUser.url.appending(component: "\(id)")
        var request = getRequestNative(url: userURL)
        request.httpMethod = "DELETE"
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            return false
        }
        
        return response.statusCode == 204
    }
    
    private func getHeadersAF() -> HTTPHeaders {
        let header = HTTPHeader(name: "x-api-key", value: "reqres-free-v1")
        let headers = HTTPHeaders(arrayLiteral: header)
        return headers
    }
    
    func fetchUsersAF(completion: @escaping (Result<[User], AFError>) -> Void) {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        AF.request(Link.allUsers.url, headers: getHeadersAF())
            .validate()
            .responseDecodable(of: UsersQuery.self, decoder: decoder) { dataResponse in
                switch dataResponse.result {
                case .success(let usersQuery):
                    completion(.success(usersQuery.data))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    func postUserAF(_ user: User, completion: @escaping (Result<PostUserQuery, AFError>) -> Void) {
        let postUserParameters = PostUserQuery(
            firstName: user.firstName,
            lastName: user.lastName
        )
        AF.request(
            Link.singleUser.url,
            method: .post,
            parameters: postUserParameters,
            headers: getHeadersAF()
        )
            .validate()
            .responseDecodable(of: PostUserQuery.self) { dataResponse in
                switch dataResponse.result {
                case .success(let postUserQuery):
                    completion(.success(postUserQuery))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func deleteUserAF(_ id: Int, completion: @escaping (Bool) -> Void) {
        let userURL = Link.singleUser.url.appendingPathComponent("\(id)")
        
        AF.request(userURL, method: .delete, headers: getHeadersAF())
            .validate(statusCode: [204])
            .response { dataResponse in
                print(dataResponse)
                switch dataResponse.result {
                case .success:
                    completion(true)
                case .failure:
                    completion(false)
                }
            }
    }
}

// MARK: - Link
extension NetworkManager {
    enum Link {
        case allUsers
        case singleUser
        case withNoData
        case withDecodingError
        case withNoUsers
        
        var url: URL {
            switch self {
            case .allUsers:
                return URL(string: "https://reqres.in/api/users/?delay=2")!
            case .singleUser:
                return URL(string: "https://reqres.in/api/users")!
            case .withNoData:
                return URL(string: "https://reqres.in_/api/users")!
            case .withDecodingError:
                return URL(string: "https://reqres.in/api/users/3?delay=2")!
            case .withNoUsers:
                return URL(string: "https://reqres.in/api/users?page=3&delay=2")!
            }
        }
    }
}
