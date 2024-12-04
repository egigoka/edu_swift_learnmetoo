//
//  NewContactViewController.swift
//  DelegationApp
//
//  Created by Alexey Efimov on 08/10/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    
    //var delegate: NewContactViewControllerDelegate!
    

    @IBAction func doneButtonPressed() {
        dismiss(animated: true)
    }
    
    @IBAction func canceButtonPressed() {
        dismiss(animated: true)
    }
}
