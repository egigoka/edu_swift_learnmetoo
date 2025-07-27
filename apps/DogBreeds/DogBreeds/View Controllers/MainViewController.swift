//
//  ViewController.swift
//  DogBreeds
//
//  Created by egigoka on 27.07.2025.
//

import UIKit

class RootViewController: UITableViewController {

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
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }

}
