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
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //imageManager.cancel()
        dogImage.image = nil
      }
    
    func configure(with breed: Breed) {
        breedLabel.text = breed.fullName
        startSettingImage(for: breed)
    }
    
    private func startSettingImage(for breed: Breed) {
        let url = networkManager.getUrlOfRAndomImage(for: breed)
        guard let url = url else { return }
        setImage(from: imageManager.getRandomImage(from: url))
    }
    
    
    private func setImage(from image: UIImage?) {
        DispatchQueue.main.async {
            self.dogImage.image = image
        }
    }
}
