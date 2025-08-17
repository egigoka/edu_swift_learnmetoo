//
//  NewUserViewController.swift
//  ReqResApp
//
//  Created by egigoka on 17.08.2025.
//

import UIKit

final class NewUserViewController: UIViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    
    var delegate: NewUserViewControllerDelegate?
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        let user = User(
            id: 0,
            firstName: firstNameTextField.text ?? "",
            lastName: lastNameTextField.text ?? ""
        )
        delegate?.createUser(user)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
