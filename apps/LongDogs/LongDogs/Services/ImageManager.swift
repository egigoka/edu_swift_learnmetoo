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
    
    private func getRandomImage(from url: URL) -> UIImage? {
        if let cachedUrl = urlCache[url] {
            return getImage(from: cachedUrl)
        }
        
        Task {
            URL
        }
        
        let urlTask = NetworkManager.shared.fetchJson(
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
    
    private func getImage(from imageUrl: URL) -> UIImage? {
        if let cached = picCache[imageUrl] {
            return cached
        }
        
        let image = try? UIImage(data: Data(contentsOf: imageUrl))
        return image
    }
    
    func cancel() {
        urlTask?.cancel()
        imageTask?.cancel()
        urlTask = nil
        imageTask = nil
    }
}
