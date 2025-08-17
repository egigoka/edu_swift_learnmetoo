//
//  UserTableViewCell.swift
//  ReqResApp
//
//  Created by egigoka on 10.08.2025.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.layer.cornerRadius = avatarImageView.layer.frame.width / 2
        }
    }
    @IBOutlet var nameLabel: UILabel!
    
    func configure(with user: User) {
        nameLabel.text = "\(user.firstName) \(user.lastName)"
        if user.avatar != nil {
            avatarImageView.kf.setImage(with: user.avatar)
        } else {
            avatarImageView.image = UIImage(systemName: "person.crop.circle")
        }
        
    }
    
}

