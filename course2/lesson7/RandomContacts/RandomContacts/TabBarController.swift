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
        
        var tableViewControllers: [UITableViewController] = []
        
        for navigationController in viewControllers ?? [] {
            if let navigationController = navigationController as? UINavigationController {
                if let tableVC = navigationController.viewControllers[0] as? ContactsTableViewController {
                    tableViewControllers.append(tableVC)
                    tableVC.people = people
                }
            }
        }
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
