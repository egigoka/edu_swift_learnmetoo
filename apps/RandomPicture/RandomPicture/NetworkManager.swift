//
//  NetworkManager.swift
//  RandomPicture
//
//  Created by egigoka on 03.08.2025.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func downloadData(from url: URL, completion: @escaping(_ data: Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error { print(error) }
            guard let data, error == nil else {
                completion(nil)
                return
            }
            completion(data)
        }.resume()
    }
}
