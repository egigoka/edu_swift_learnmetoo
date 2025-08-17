//
//  NewUserViewController.swift
//  ReqResApp
//
//  Created by egigoka on 17.08.2025.
//

import UIKit

class NewUserViewController: UIViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    
    private let networkManager = NetworkManager.shared
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        let user = User(
            id: 0,
            firstName: firstNameTextField.text ?? "",
            lastName: lastNameTextField.text ?? ""
        )
        post(user: user)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

// MARK: - Networking
extension NewUserViewController {
    private func post(user: User) {
        
    }
}
