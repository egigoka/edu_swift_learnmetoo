//
//  UserInfoViewController.swift
//  AboutMe
//
//  Created by egigoka on 27/10/2024.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    // MARK: Public Properties
    var user: User!
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print("UserInfoViewController loaded")
    }
    
    // MARK: Deinit
    deinit {
        print("UserInfoViewController deinitialized")
    }
    
}
