//
//  ViewController.swift
//  DogBreeds
//
//  Created by egigoka on 27.07.2025.
//

import UIKit

class RootViewController: UITableViewController {

    private var breeds: [Breed] = []
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await loadData()
        }
    }

    private func loadData() async {
        guard let url = URL(string: Url.listAllBreeds.urlString) else { return }
        guard let result = await networkManager.get(from: url) else { return }
        guard let result = result as? Dictionary<String, Any?> else { return }
        guard let result = result["message"] as? Dictionary<String, Any> else { return }
        
        breeds = Breed.getBreeds(from: result)
        
        print(result)
        print(breeds)
    }
    
//    private func loadData() {
//        guard let url = URL(string: Url.listAllBreeds.urlString) else { return }
//        let _ = NetworkManager.shared.get(
//            from: url,
//            responseType: APIResponse<Dictionary<String, [String]>>.self
//        ) { result in
//            switch result {
//            case .success(let response):
//                self.breeds = Breed.getBreeds(from: response)
//                  DispatchQueue.main.async {
//                      self.tableView.reloadData()
//                  }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let breedVC = segue.destination as? BreedViewController else { return }
        guard let breedCell = sender as? DogBreedCell else { return }
        
        breedVC.image = breedCell.dogImage.image
        breedVC.breedName = breedCell.breedLabel.text
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

