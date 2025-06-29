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
        
        for tableVC in viewControllers ?? [] {
            if var tableVC = tableVC as? PeopleReceiving {
                tableVC.people = people
            }
        }
        
        for navigationController in viewControllers ?? [] {
            if let navigationController = navigationController as? UINavigationController {
                if var tableVC = navigationController.viewControllers[0] as? PeopleReceiving {
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
