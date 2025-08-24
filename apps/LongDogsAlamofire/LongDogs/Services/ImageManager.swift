//
//  ImageManager.swift
//  LongDogs
//
//  Created by egigoka on 17.08.2025.
//

import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    private let cache = ImageCache()
    private let networkManager = NetworkManager.shared
    
    private init() {}
    
    
    
    func getRandomImage(from url: URL) async -> UIImage? {
        if let cachedURL = await cache.cachedUrl(for: url) {
            return await getImage(from: cachedURL)
        }
        let json = await networkManager.get(from: url)
        print(json as? String)
        return nil
        
        
    }
    
//    func getRandomImage(from url: URL) async -> UIImage? {
//        if let cachedUrl = await cache.cachedUrl(for: url) {
//            return await getImage(from: cachedUrl)
//        }
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let decoded = try JSONDecoder().decode(APIResponse<String>.self, from: data)
//            guard let randomPictureUrl = URL(string: decoded.message) else { return nil }
//            
//            await cache.setCachedUrl(url, value: randomPictureUrl)
//            return await getImage(from: randomPictureUrl)
//        } catch {
//            return nil
//        }
//    }
    
    private func getImage(from imageUrl: URL) async -> UIImage? {
        if let cached = await cache.cachedImage(for: imageUrl) {
            return cached
        }
        guard let data = try? Data(contentsOf: imageUrl) else { return nil }
        let image = UIImage(data: data)
        
        await cache.setCachedImage(imageUrl, value: image)
        return image
    }
}

extension ImageManager {
    private actor ImageCache { // multithread safe
        private var urlCache: [URL: URL] = [:]
        private var picCache: [URL: UIImage] = [:]

        func cachedUrl(for url: URL) -> URL? {
            urlCache[url]
        }

        func setCachedUrl(_ url: URL, value: URL) {
            urlCache[url] = value
        }

        func cachedImage(for url: URL) -> UIImage? {
            picCache[url]
        }

        func setCachedImage(_ url: URL, value: UIImage?) {
            picCache[url] = value
        }
    }
}
