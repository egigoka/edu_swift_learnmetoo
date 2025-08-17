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
    
    private init() {}
    
    func getRandomImage(from url: URL) async -> UIImage? {
        if let cachedUrl = urlCache[url] {
            return getImage(from: cachedUrl)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(APIResponse<String>.self, from: data)
            guard let randomPictureUrl = URL(string: decoded.message) else { return nil }
            
            urlCache[url] = randomPictureUrl
            return getImage(from: randomPictureUrl)
        } catch {
            return nil
        }
    }
    
    private func getImage(from imageUrl: URL) -> UIImage? {
        if let cached = picCache[imageUrl] {
            return cached
        }
        guard let data = try? Data(contentsOf: imageUrl) else { return nil }
        let image = UIImage(data: data)
        
        picCache[imageUrl] = image
        return image
    }
    
}
