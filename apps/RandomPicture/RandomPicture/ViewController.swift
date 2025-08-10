//
//  ViewController.swift
//  RandomPicture
//
//  Created by egigoka on 03.08.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet var keyTextField: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        keyTextField.resignFirstResponder()
    }
    
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
        networkManager.downloadData(from: url) { data in
            
            guard let data else { return }
            
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
            
            self.networkManager.downloadData(from: pictureUrl) { data in
                guard let data else { return }
                let image = UIImage(data: data)
                DispatchQueue.main.async { [weak self] in
                    self?.photoImageView.image = image
                }
            }
        }
    }
    
    private func uriEncode(_ string: String) -> String {
        string.replacingOccurrences(of: " ", with: "+")
    }
}
