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
    
    private let imageManager = ImageManager.shared
    private let networkManager = NetworkManager.shared
    
    private var imageTask: Task<Sendable, Error>? = nil
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dogImage.image = nil
        imageTask?.cancel()
      }
    
    func configure(with breed: Breed) {
        breedLabel.text = breed.fullName
        startSettingImage(for: breed)
    }
    
    private func startSettingImage(for breed: Breed) {
        let url = networkManager.getUrlOfRAndomImage(for: breed)
        guard let url = url else { return }
        imageTask = Task {
            await setImage(from: imageManager.getRandomImage(from: url))
        }
    }
    
    
    private func setImage(from image: UIImage?) {
        DispatchQueue.main.async {
            self.dogImage.image = image
        }
    }
}
