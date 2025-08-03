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
        tableView.reloadData()
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
        for (offset, breed) in breeds.enumerated() {
            var url: URL?
            switch breed.type {
            case .breed:
                url = URL(string: Url.randomImage(breed: breed.name).urlString)
            case .subBreed:
                guard let subBreed = breed.subBreed else {continue}
                url = URL(string: Url.randomImageWithSubBreed(
                    breed: breed.name,
                    subBreed: subBreed
                ).urlString)
                break
            }
            guard let url = url else { continue }
            var breedWithImage = breed
            // TODO: move it to init of breed
            NetworkManager.shared.fetchJson(
                from: url,
                responseType: APIResponse<String>.self
            ) { result in
                switch result {
                case .success(let response):
                    breedWithImage.randomPicture = response.message
                    self.breeds[offset] = breedWithImage
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    
    // TODO: move it somewhree out of vc
    private func populateBreeds(from breedsDict: Dictionary<String, [String]>) {
        breeds = []
        for (breed, subBreeds) in breedsDict {
            
            
            
            print(breed, subBreeds)
            if subBreeds.count == 0 {
                self.breeds.append(Breed(name: breed, type: .breed, subBreed: nil))
            } else {
                for subBreed in subBreeds {
                    self.breeds.append(Breed(name: breed, type: .subBreed, subBreed: subBreed))
                }
            }
        }
    }
}

// MARK: - Table view data source
extension RootViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        breeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let breed = breeds[indexPath.row]
        
        cell.textLabel?.text = breed.name
        cell.detailTextLabel?.text = breed.subBreed
        cell.imageView?.image = 
        
        return cell
    }
}
