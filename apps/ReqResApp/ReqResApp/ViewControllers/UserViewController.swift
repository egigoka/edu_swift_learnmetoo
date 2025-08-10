//
//  UserViewController.swift
//  ReqResApp
//
//  Created by egigoka on 10.08.2025.
//

import UIKit
import Kingfisher

final class UserViewController: UIViewController {
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        composeUser(user)
    }
    
    private func composeUser(_ user: User) {
        nameLabel.text = "\(user.firstName) \(user.lastName)"
        
        avatarImageView.kf.setImage(with: user.avatar)
    }
}
