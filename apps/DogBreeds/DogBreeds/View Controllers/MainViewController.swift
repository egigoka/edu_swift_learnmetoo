//
//  ViewController.swift
//  DogBreeds
//
//  Created by egigoka on 27.07.2025.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    private func loadData() {
        DispatchQueue.global().async {
            NetworkManager.shared.fetchJson(from: <#T##URL#>, responseType: <#T##Decodable.Type#>, completion: <#T##(Result<Decodable, any Error>) -> Void#>)
        }
    }

}

