//
//  ViewController.swift
//  DogBreeds
//
//  Created by egigoka on 27.07.2025.
//

import UIKit

class RootViewController: UITableViewController {

    private var breeds: [Breed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    private func loadData() {
        guard let url = URL(string: Url.listAllBreeds.urlString) else { return }
        NetworkManager.shared.fetchJson(
            from: url,
            responseType: APIResponse<Dictionary<String, [String]>>.self
        ) { result in
            switch result {
            case .success(let response):
                self.populateBreeds(from: response.message)
            case .failure(let error):
                print(error)
            }
        }
        for breed in breeds {
            var url: URL?
            switch breed.type {
            case .breed:
                url = URL(string: Url.randomImage(breed: breed.name).urlString)
            case .subBreed:
                guard let subBreed = breed.subBreed else {continue}
                url = URL(string: Url.randomImageWithSubBreed(
                    breed: breed.name,
                    subBreed: subBreed).urlString)
            
            }
        }
        
    }
    
    private func populateBreeds(from breedsDict: Dictionary<String, [String]>) {
        breeds = []
        for (breed, subBreeds) in breedsDict {
            print(breed, subBreeds)
            if subBreeds.count == 0 {
                self.breeds.append(Breed(name: breed, subBreed: nil, type: .breed))
            } else {
                for subBreed in subBreeds {
                    self.breeds.append(Breed(name: breed, subBreed: subBreed, type: .subBreed))
                }
            }
        }
    }
    
    

}
