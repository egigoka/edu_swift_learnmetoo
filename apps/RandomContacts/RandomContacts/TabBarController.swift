//
//  TabBarController.swift
//  RandomContacts
//
//  Created by egigoka on 22.06.2025.
//

import UIKit

class TabBarController: UITabBarController {

    let people = Person.getRandomPeople()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for tableVC in viewControllers ?? [] {
            if var tableVC = tableVC as? PeopleReceiving {
                tableVC.people = people
            }
        }
    }

}
 
