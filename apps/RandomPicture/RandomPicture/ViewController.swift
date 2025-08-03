//
//  ViewController.swift
//  RandomPicture
//
//  Created by egigoka on 03.08.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    private let networkManager = NetworkManager.shared

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
            
            let imageInfo: PixabayResponse?
            
            do {
                imageInfo = try JSONDecoder().decode(PixabayResponse.self, from: data)
            } catch {
                print(String(data: data, encoding: .utf8) ?? "Data not decoded in utf8")
                print("Error decoding JSON: \(error)")
                return
            }
            
            let pictureUrl = imageInfo?.hits.randomElement()?.largeImageURL
            
            guard let pictureUrl = pictureUrl else {
                print("\(pictureUrl ?? "No URL")")
                return
            }
            
            guard let pictureUrl = URL(string: pictureUrl) else {
                print("not an URL")
                return
            }
            
            URLSession.shared.dataTask(with: pictureUrl) { data, _, error in
                guard let data, error == nil else { return }
                let image = UIImage(data: data)
                DispatchQueue.main.async { [weak self] in
                    self?.photoImageView.image = image
                }
            }.resume()
            
            
        }.resume()
    }
    
    private func uriEncode(_ string: String) -> String {
        string.replacingOccurrences(of: " ", with: "+")
    }
}
