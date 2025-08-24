//
//  BreedViewController.swift
//  DogBreeds
//
//  Created by egigoka on 03.08.2025.
//

import UIKit

class BreedViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var image: UIImage?
    var breedName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        navigationItem.title = breedName
    }

}
