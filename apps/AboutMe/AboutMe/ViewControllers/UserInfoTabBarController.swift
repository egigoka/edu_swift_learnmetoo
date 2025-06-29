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
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard let delegate = delegate as? ChildViewControllerDelegate else {
            return
        }
        if isBeingDismissed {
            delegate.didDismissWithSwipe()
        }
    }
}
