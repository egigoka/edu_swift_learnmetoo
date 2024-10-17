//
//  ContactMangerViewController.swift
//  NavigationApp
//
//  Created by Alexey Efimov on 20.10.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ContactMangerViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    
    
    @IBAction func cancelAction() {
        dismiss(animated: true)
    }
    
    deinit {
        print("ContactMangerViewController has been dealocated")
    }
    
}
