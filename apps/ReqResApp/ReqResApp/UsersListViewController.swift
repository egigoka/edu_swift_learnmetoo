//
//  UsersListViewController.swift
//  ReqResApp
//
//  Created by egigoka on 10.08.2025.
//

import UIKit

final class UsersListViewController: UITableViewController {
    
    private let networkManager = NetworkManager.shared
    private var users: [User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        fetchUsers()
    }
    
}

// MARK: - Networking
extension UsersListViewController {
    private func fetchUsers() {
        users = [User.example]
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension UsersListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "user") else {
            return UITableViewCell()
        }
        
        // Design a cell
        // Finding the user first
        let user = users[indexPath.row]
        
        // Creating cell content
        var content = cell.defaultContentConfiguration()
        content.text = user.firstName
        content.secondaryText = user.lastName
        
        content.image = UIImage(systemName: "face.smiling")
        networkManager.fetchAvatar(from: <#T##URL#>, completion: <#T##(Data) -> Void#>)
        content.image = UIImage(data: networkManager.fetchAvatar(from: <#T##URL#>, completion: <#T##(Data) -> Void#>))
        
        cell.contentConfiguration = content
        
        return cell
    }
}
