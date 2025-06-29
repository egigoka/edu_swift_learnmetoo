//
//  PersonViewController.swift
//  RandomContacts
//
//  Created by egigoka on 29.06.2025.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(person.name) \(person.surname)"
        phoneLabel.text = "Phone: \(person.phoneNumber)"
        emailLabel.text = "Email: \(person.email)"
    }

}
