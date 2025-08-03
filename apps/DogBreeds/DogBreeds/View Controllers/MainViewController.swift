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
    
    // TODO: move it somewhree out of vc
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
            print("    2 data reloaded")
        }
        
    }
    
    private func updateImage(for indexPath: IndexPath) {
        
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

class DogBreedCell: UITableViewCell {
    
    @IBOutlet var dogImage: UIImageView!
    @IBOutlet var breedLabel: UILabel!
    @IBOutlet var subBreedLabel: UILabel!
    
    private var urlTask: URLSessionDataTask?
    private var imageTask: URLSessionDataTask?
    
    static var urlCache: [URL: URL] = [:]
    static var picCache: [URL: UIImage] = [:]
    
    override func prepareForReuse() {
        super.prepareForReuse()
        urlTask?.cancel()
        imageTask?.cancel()
        urlTask = nil
        imageTask = nil
        dogImage.image = nil
      }
    
    func configure(with breed: Breed) {
        breedLabel.text = breed.name
        subBreedLabel.text = breed.subBreed
        startDownloadingImage(for: breed)
    }
    
    private func getUrlOfRAndomImage(for breed: Breed) -> URL? {
        var url: URL?
        
        switch breed.type {
        case .breed:
            url = URL(string: Url.randomImage(breed: breed.name).urlString)
        case .subBreed:
            guard let subBreed = breed.subBreed else { return nil }
            url = URL(string: Url.randomImageWithSubBreed(
                breed: breed.name,
                subBreed: subBreed
            ).urlString)
        }
        return url
    }
    
    private func startDownloadingImage(for breed: Breed) {
        let url = getUrlOfRAndomImage(for: breed)
        guard let url = url else { return }
        getImageAndSetIt(from: url)
    }
    
    private func getImageAndSetIt(from url: URL) {
        if let cached = DogBreedCell.urlCache[url] {
            self.getImage(from: cached)
            return
        }
        
        urlTask = NetworkManager.shared.fetchJson(
            from: url,
            responseType: APIResponse<String>.self
        )
        { response in
            switch response {
            case .success(let response):
                guard let imageUrl = URL(string: response.message) else { return }
                
                DogBreedCell.urlCache[url] = imageUrl
                
                self.getImage(from: imageUrl)
            case .failure(let error):
                guard let error = error as? URLError else { return }
                if error.code != .cancelled { print(error) }
            }
        }
    }
    
    private func getImage(from imageUrl: URL) {
        if let cached = DogBreedCell.picCache[imageUrl] {
            self.setImage(from: cached)
            return
        }
        
        self.imageTask = NetworkManager.shared.fetch(from: imageUrl)
        { result in
            switch result {
            case .success(let result):
                let image = UIImage(data: result) ?? nil
                DogBreedCell.picCache[imageUrl] = image
                self.setImage(from: image)
            case .failure(let error):
                guard let error = error as? URLError else { return }
                if error.code != .cancelled { print(error) }
            }
        }
    }
    
    private func setImage(from image: UIImage?) {
        DispatchQueue.main.async {
            self.dogImage.image = image
        }
    }
}

