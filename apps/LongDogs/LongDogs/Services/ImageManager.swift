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
    
    private var urlTask: URLSessionDataTask?
    private var imageTask: URLSessionDataTask?
    
    private init() {}
    
    private func setImage(from url: URL) {
        if let cached = urlCache[url] {
            self.getImage(from: cached)
            return
        }
        
        urlTask = NetworkManager.shared.fetchJson(
            from: url,
            responseType: APIResponse<String>.self
        )
        { [weak self] response in
            switch response {
            case .success(let response):
                guard let imageUrl = URL(string: response.message) else { return }
                
                self?.urlCache[url] = imageUrl
                
                self?.getImage(from: imageUrl)
            case .failure(let error):
                guard let error = error as? URLError else { return }
                if error.code != .cancelled { print(error) }
            }
        }
    }
    
    private func getImage(from imageUrl: URL) {
        if let cached = picCache[imageUrl] {
            self.setImage(from: cached)
            return
        }
        
        self.imageTask = NetworkManager.shared.fetch(from: imageUrl)
        { [weak self] result in
            switch result {
            case .success(let result):
                let image = UIImage(data: result) ?? nil
                self?.picCache[imageUrl] = image
                self?.setImage(from: image)
            case .failure(let error):
                guard let error = error as? URLError else { return }
                if error.code != .cancelled { print(error) }
            }
        }
    }
}
