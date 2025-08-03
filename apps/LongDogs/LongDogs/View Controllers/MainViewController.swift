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
        let _ = NetworkManager.shared.fetchJson(
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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let breedVC = segue.destination as? BreedViewController else { return }
        guard let breedCell = sender as? DogBreedCell else { return }
        
        breedVC.image = breedCell.dogImage.image
        breedVC.breedName = breedCell.breedLabel.text
    }
    
    // TODO: move it somewhree out of vc // I didn't know where to :(
    private func populateBreeds(from breedsDict: Dictionary<String, [String]>) {
        breeds = []
        for (breed, subBreeds) in breedsDict {
            if subBreeds.count == 0 {
                self.breeds.append(Breed(name: breed, type: .breed, subBreed: nil))
            } else {
                for subBreed in subBreeds {
                    self.breeds.append(Breed(name: breed, type: .subBreed, subBreed: subBreed))
                }
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
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
        
        guard let cell = cell as? DogBreedCell else { return cell }
        
        cell.configure(with: breeds[indexPath.row])
        
        return cell
    }
}

