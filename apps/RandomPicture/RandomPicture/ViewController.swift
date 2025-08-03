//
//  ViewController.swift
//  RandomPicture
//
//  Created by egigoka on 03.08.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!

    @IBAction func showNextAction() {
        fetchImage()
    }
    
}

// Networking
extension ViewController {
    private func fetchImage() {
        
        let urlString = "https://pixabay.com/api/?key=\(Secrets.shared.pixabayKey)"
        
        guard let url = URL(string: "https://picsum.photos/2048/2048") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data, error == nil else { return }
            let image = UIImage(data: data)
            DispatchQueue.main.async { [weak self] in
                self?.photoImageView.image = image
            }
        }.resume()
    }
}
