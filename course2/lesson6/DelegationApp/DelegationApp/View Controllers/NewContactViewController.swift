//
//  NewContactViewController.swift
//  DelegationApp
//
//  Created by Alexey Efimov on 08/10/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

protocol FullyNameProtocol {
    var fullName: String { get }
}

class NewContactViewController: UIViewController, FullyNameProtocol {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    
    var delegate: NewContactViewControllerDelegate!
    
    var fullName: String {
        let person = Person(
            name: firstNameTextField.text ?? "",
            surname: lastNameTextField.text ?? ""
        )
        return "\(person.name) \(person.surname)"
    }

    @IBAction func doneButtonPressed() {
        delegate.savePerson(fullName)
        dismiss(animated: true)
    }
    
    @IBAction func canceButtonPressed() {
        dismiss(animated: true)
    }
}
