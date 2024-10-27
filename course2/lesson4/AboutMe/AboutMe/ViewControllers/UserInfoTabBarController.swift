//
//  UserInfoTabBarController.swift
//  AboutMe
//
//  Created by egigoka on 27/10/2024.
//

import UIKit

protocol ChildViewControllerDelegate: UITabBarControllerDelegate {
    func didDismissWithSwipe()
}

class UserInfoTabBarController: UITabBarController {
    
    // MARK: Public Properties
    var user: User!
    
    // MARK: Override Methods
    
    override func viewDidLoad() {
        setChildDelegate(delegate as? ChildViewControllerDelegate)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard var delegate = 
        if isBeingDismissed {
            delegate?.didDismissWithSwipe()
        }
    }
    
    // MARK: Public Methods
    func setChildDelegate(_ delegate: ChildViewControllerDelegate?) {
        self.childDelegate = delegate
    }
}
