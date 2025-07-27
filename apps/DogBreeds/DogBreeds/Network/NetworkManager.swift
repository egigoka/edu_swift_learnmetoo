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
    ) {
        DispatchQueue.global().async{
            self.session.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                    return
                }
                
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    }
    
    func fetch(
        from url: URL
    ) -> Result<Data, Error> {
        DispatchQueue.global().async {
            self.session.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    return .failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data"]))
                }
                
                return .success(data)
            }.resume()
        }
    }
    
    
}
