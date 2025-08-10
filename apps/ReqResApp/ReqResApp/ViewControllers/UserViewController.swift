//
//  UserViewController.swift
//  ReqResApp
//
//  Created by egigoka on 10.08.2025.
//

import UIKit

final class UserViewController: UIViewController {
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    private let networkManager = NetworkManager.shared
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        composeUser(user)
    }
    
    private func composeUser(_ user: User) {
        nameLabel.text = "\(user.firstName) \(user.lastName)"
        
        networkManager.fetchAvatar(from: user.avatar) { [weak self] data in
            self?.avatarImageView.image = UIImage(data: data)
        }
    }
}
