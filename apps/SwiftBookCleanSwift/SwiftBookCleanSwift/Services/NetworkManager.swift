//
//  NetworkManager.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let coursesURL = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    
    private init() {}
    
    func fetchData(completion: @Sendable @escaping ([Course]) -> Void) {
        guard let url = URL(string: coursesURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Course].self, from: data)
                completion(courses)
            } catch {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
}
