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
        fetchImage(key: "sea")
    }
    
}

// Networking
extension ViewController {
    private func fetchImage(key: String) {
        
        let urlString = "https://pixabay.com/api/?key=\(Secrets.shared.pixabayKey)&q=\(uriEncode(key))"
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data, error == nil else { return }
            
            var imageInfo: PixabayResponse?
            
            do {
                let imageInfo = try JSONDecoder().decode(PixabayResponse.self, from: data)
            } catch {
                print("Error decoding JSON: \(error)")
                return
            }
            
            let pictureUrl = imageInfo?.hits.first?.imageURL
            
            guard let pictureUrl = pictureUrl else {
                print("\(pictureUrl)")
                return
            }
            
            URLSession.shared.dataTask(with: <#T##URLRequest#>)
            
            let image = UIImage(data: data)
            DispatchQueue.main.async { [weak self] in
                self?.photoImageView.image = image
            }
        }.resume()
    }
    
    private func uriEncode(_ string: String) -> String {
        string.replacingOccurrences(of: " ", with: "+")
    }
}
