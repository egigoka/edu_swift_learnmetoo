//
//  CharacterImageView.swift
//  RickAndMorty
//
//  Created by Alexey Efimov on 19.11.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class CharacterImageView: UIImageView {
    
    func fetchImage(from url: String) {
        guard let imageUrl = URL(string: url) else {
            image = UIImage(named: "picture")
            return
        }
        // Load image from cache if it's there
        if let cachedImage = getCachedImage(from: imageUrl) {
            image = cachedImage
            return
        }
        
        // Load image from network
        ImageManager.shared.fetchImage(from: imageUrl) { [weak self] data, response in
            DispatchQueue.main.async {
                self?.image = UIImage(data: data)
            }
            // Save image to cache
            self?.saveDataToCache(with: data, and: response)
        }
    }
    
    private func getCachedImage(from url: URL) -> UIImage? {
        let urlRequest = URLRequest(url: url)
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest) {
            return UIImage(data: cachedResponse.data)
        }
        
        return nil
    }
    
    private func saveDataToCache(with data: Data, and response: URLResponse) {
        guard let url = response.url else { return }
        let urlRequest = URLRequest(url: url)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
    }
}
