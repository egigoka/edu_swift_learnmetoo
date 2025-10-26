//
//  NetworkManager.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    //private let coursesURL = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    private let coursesURL = "http://10.1.0.6:9090/fixed/api_courses"
    
    func fetchData(completion: @escaping (_ courses: [Course])->()) {
        guard let url = URL(string: coursesURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Course].self, from: data)
                completion(courses)
            } catch let error {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
}
