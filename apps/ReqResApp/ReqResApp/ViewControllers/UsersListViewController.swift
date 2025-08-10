//
//  UsersListViewController.swift
//  ReqResApp
//
//  Created by egigoka on 10.08.2025.
//

import UIKit

final class UsersListViewController: UITableViewController {
    
    private let networkManager = NetworkManager.shared
    private var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        fetchUsers()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let user = users[indexPath.row]
        let userVC = segue.destination as? UserViewController
        userVC?.user = user
    }
    
}

// MARK: - Networking
extension UsersListViewController {
    private func fetchUsers() {
//        users = [User.example]
        networkManager.fetchUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
            case .failure(let error):
                print("Error in fetchUsers: \(error.localizedDescription)")
            }
            self?.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension UsersListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") else {
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
        
        cell.contentConfiguration = content
        
        networkManager.fetchAvatar(from: user.avatar) { imageData in
            content.image = UIImage(data: imageData)
            content.imageProperties.cornerRadius = tableView.rowHeight / 2
            
            cell.contentConfiguration = content
        }
        
        return cell
    }
}

class UserTableViewCell: UITableViewCell {

}
