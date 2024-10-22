//
//  ContactManagerViewController.swift
//  NavigationApp
//
//  Created by egigoka on 22/10/2024.
//  Copyright © 2024 Alexey Efimov. All rights reserved.
//

import UIKit


class ContactManagerViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    
    @IBAction func cancelAction() {
        dismiss(animated: true)
    }
    
    
    
    deinit {
        print("ContactManagerViewController has been deallocated")
    }
}
