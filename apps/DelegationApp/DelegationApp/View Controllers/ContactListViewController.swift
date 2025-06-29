//
//  ContactListViewController.swift
//  DelegationApp
//
//  Created by Alexey Efimov on 08/10/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

protocol NewContactViewControllerDelegate {
    func savePerson(_ person: String)
}

class ContactListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    private(set) var contacts: [String] = ["Tim Cook"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newContactVC = segue.destination as! NewContactViewController
        newContactVC.delegate = self
    }
    
}

extension ContactListViewController: NewContactViewControllerDelegate {
    func savePerson(_ person: String) {
        contacts.append(person)
    }
}
