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
    
    private init() {}
    
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
        private var picCache: [URL: UIImage] = [:]

        func cachedImage(for url: URL) -> UIImage? {
            picCache[url]
        }

        func setCachedImage(_ url: URL, value: UIImage?) {
            picCache[url] = value
        }
    }
}
