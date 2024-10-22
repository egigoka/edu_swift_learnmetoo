//
//  UserListViewController.swift
//  NavigationApp
//
//  Created by egigoka on 22/10/2024.
//  Copyright © 2024 Alexey Efimov. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var users = ["Rick", "Morty"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userDetailsVC = segue.destination as? UserDetailsViewController else {
            return
        }
        
        userDetailsVC.userName = sender as? String
        
    }

    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard let contentManagerVC = segue.source as? ContactManagerViewController else {
            return
        }
        
        guard let userName = contentManagerVC.userNameTextField.text else {
            return
        }
        
        users.append(userName)
        
    }
    
}
