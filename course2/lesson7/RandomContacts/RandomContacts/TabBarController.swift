//
//  TabBarController.swift
//  RandomContacts
//
//  Created by egigoka on 22.06.2025.
//

import UIKit

class TabBarController: UITabBarController {

    let people = Person.getRandomItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tableViewViewControllers: [UITableViewController] = []
        
        for tableViewVC in viewControllers ?? [] {
            if let tableViewVC = tableViewVC as? ContactsTableViewController {
                tableViewViewControllers.append(tableViewVC)
                tableViewVC.people = people
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
