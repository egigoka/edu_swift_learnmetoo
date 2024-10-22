//
//  UserDetailsViewController.swift
//  NavigationApp
//
//  Created by egigoka on 22/10/2024.
//  Copyright © 2024 Alexey Efimov. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {

    @IBOutlet var userNameLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = userName
    }
    
    deinit {
        print("UserDetailsViewController has been deallocated")
    }

}
