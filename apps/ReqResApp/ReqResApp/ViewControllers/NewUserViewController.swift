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
    
    var delegate: NewUserViewControllerDelegate?
    
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
        networkManager.postUser(user) { result in
            switch result {
            case .success(let postUserQuery):
                // create User in UserList
                self.delegate?.createUser(User(postUserQuery: postUserQuery))
                print("\(postUserQuery) created")
            case .failure(let error):
                print("Error in post user: \(error)")
                
            }
        }
    }
}
