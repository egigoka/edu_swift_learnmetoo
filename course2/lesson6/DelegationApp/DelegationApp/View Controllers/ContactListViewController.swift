//
//  ContactListViewController.swift
//  DelegationApp
//
//  Created by Alexey Efimov on 08/10/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    private(set) var contacts: [String] = ["Tim Cook"]
    
}
