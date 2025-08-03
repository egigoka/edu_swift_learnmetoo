//
//  DogBreedCell.swift
//  DogBreeds
//
//  Created by egigoka on 03.08.2025.
//

import UIKit

class DogBreedCell: UITableViewCell {
    
    @IBOutlet var dogImage: UIImageView!
    @IBOutlet var breedLabel: UILabel!
    
    private var urlTask: URLSessionDataTask?
    private var imageTask: URLSessionDataTask?
    
    static var urlCache: [URL: URL] = [:]
    static var picCache: [URL: UIImage] = [:]
    
    override func prepareForReuse() {
        super.prepareForReuse()
        urlTask?.cancel()
        imageTask?.cancel()
        urlTask = nil
        imageTask = nil
        dogImage.image = nil
      }
    
    func configure(with breed: Breed) {
        breedLabel.text = breed.fullName
        startSettingImage(for: breed)
    }
    
    private func startSettingImage(for breed: Breed) {
        let url = getUrlOfRAndomImage(for: breed)
        guard let url = url else { return }
        setImage(from: url)
    }
    
    private func getUrlOfRAndomImage(for breed: Breed) -> URL? {
        var url: URL?
        
        switch breed.type {
        case .breed:
            url = URL(string: Url.randomImage(breed: breed.name).urlString)
        case .subBreed:
            guard let subBreed = breed.subBreed else { return nil }
            url = URL(string: Url.randomImageWithSubBreed(
                breed: breed.name,
                subBreed: subBreed
            ).urlString)
        }
        return url
    }
    
    private func setImage(from url: URL) {
        if let cached = DogBreedCell.urlCache[url] {
            self.getImage(from: cached)
            return
        }
        
        urlTask = NetworkManager.shared.fetchJson(
            from: url,
            responseType: APIResponse<String>.self
        )
        { response in
            switch response {
            case .success(let response):
                guard let imageUrl = URL(string: response.message) else { return }
                
                DogBreedCell.urlCache[url] = imageUrl
                
                self.getImage(from: imageUrl)
            case .failure(let error):
                guard let error = error as? URLError else { return }
                if error.code != .cancelled { print(error) }
            }
        }
    }
    
    private func getImage(from imageUrl: URL) {
        if let cached = DogBreedCell.picCache[imageUrl] {
            self.setImage(from: cached)
            return
        }
        
        self.imageTask = NetworkManager.shared.fetch(from: imageUrl)
        { result in
            switch result {
            case .success(let result):
                let image = UIImage(data: result) ?? nil
                DogBreedCell.picCache[imageUrl] = image
                self.setImage(from: image)
            case .failure(let error):
                guard let error = error as? URLError else { return }
                if error.code != .cancelled { print(error) }
            }
        }
    }
    
    private func setImage(from image: UIImage?) {
        DispatchQueue.main.async {
            self.dogImage.image = image
        }
    }
}
