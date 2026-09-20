//
//  NetworkManager.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 17.08.2020.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
        
    func fetchCourses(completion: @escaping (_ courses: [Course])->()) {
        guard let url = URL(string: Constans.courseURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { print(error); return }
            guard let data = data else { return }
                        
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Course].self, from: data)
                DispatchQueue.main.async {
                    completion(courses)
                }
            } catch let error {
                print("Error serialization json", error.localizedDescription)
            }
            
        }.resume()
    }
    
    func fetchImageData(from url: String) -> Data? {
        guard let imageURL = URL(string: url) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        return imageData
    }
}

enum Constans: String {
    case courseURL = "http://10.1.0.6:9090/fixed/api_courses"
}
