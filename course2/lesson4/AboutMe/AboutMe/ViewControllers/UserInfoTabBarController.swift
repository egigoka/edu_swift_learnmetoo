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
    
    // MARK: Custom Delegate
    private weak var childDelegate: ChildViewControllerDelegate? {
        didSet {
            super.delegate = childDelegate
        }
    }
    
    // MARK: Override Methods
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isBeingDismissed {
            childDelegate?.didDismissWithSwipe()
        }
    }
    
    // MARK: Public Methods
    func setChildDelegate(_ delegate: ChildViewControllerDelegate?) {
        self.childDelegate = delegate
    }
}
