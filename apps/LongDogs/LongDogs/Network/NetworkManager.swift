//
//  NetworkManager.swift
//  DogBreeds
//
//  Created by egigoka on 27.07.2025.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let session = URLSession.shared
    
    private init() {}
    
    func fetchJson<T: Decodable>(
        from url: URL,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) -> URLSessionDataTask {
        fetch(from: url) { result in
            switch result {
            case .success(let data):
                do {
                    let decoded = try JSONDecoder().decode(responseType, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetch(
        from url: URL,
        completion: @escaping (Result<Data, Error>) -> Void
    ) -> URLSessionDataTask {
        let dataTask = session.dataTask(with: url) { data, response, error in
            let result: Result<Data, Error>
            
            if let error = error {
                result = .failure(error)
            } else if let data = data {
                result = .success(data)
            } else {
                result = .failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data"]))
            }
            
            completion(result)
        }
        dataTask.resume()
        return dataTask
    }
}
