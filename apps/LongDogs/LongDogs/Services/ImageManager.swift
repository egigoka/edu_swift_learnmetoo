//
//  ImageManager.swift
//  LongDogs
//
//  Created by egigoka on 17.08.2025.
//

import UIKit

class ImageManager {
    static let shared = ImageManager()
    
    private var urlCache: [URL: URL] = [:]
    private var picCache: [URL: UIImage] = [:]
    
    private var urlTasks: [URLSessionDataTask] = []
    private var imageTasks: [URLSessionDataTask] = []
    
    private init() {}
    
    func getRandomImage(from url: URL) -> UIImage? {
        if let cachedUrl = urlCache[url] {
            return getImage(from: cachedUrl)
        }
        
        var randomPictureUrlString: String?
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoded = try JSONDecoder().decode(APIResponse<String>.self, from: data)
                randomPictureUrlString = decoded.message
            } catch {
                return
            }
        }
        
        guard let randomPictureUrlString = randomPictureUrlString else { return nil }
        guard let randomPictureUrl = URL(string: randomPictureUrlString) else { return nil }
        
        urlCache[url] = randomPictureUrl
        
        return getImage(from: randomPictureUrl)
    }
    
    private func getImage(from imageUrl: URL) -> UIImage? {
        if let cached = picCache[imageUrl] {
            return cached
        }
        print("cache miss")
        print(imageUrl)
        guard let data = try? Data(contentsOf: imageUrl) else { return nil }
        print(data)
        let image = UIImage(data: data)
        return image
    }
    
}
