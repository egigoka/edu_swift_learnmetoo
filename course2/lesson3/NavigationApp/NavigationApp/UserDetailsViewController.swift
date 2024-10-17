//
//  UserDetailsViewController.swift
//  NavigationApp
//
//  Created by Alexey Efimov on 19.10.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
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
        print("UserDetailsViewController has been dealocated")
    }
}
