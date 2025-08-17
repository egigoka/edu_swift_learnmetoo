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
    
    
    
    
    
    
    
    private func setImage(from image: UIImage?) {
        DispatchQueue.main.async {
            self.dogImage.image = image
        }
    }
}
