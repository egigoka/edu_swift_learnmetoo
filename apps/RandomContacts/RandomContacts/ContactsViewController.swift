//
//  ContactsTableViewController.swift
//  RandomContacts
//
//  Created by egigoka on 23.06.2025.
//

import UIKit

class ContactsViewController: UITableViewController {
    
    var people: [Person] = []
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? PersonViewController else { return }
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        destination.person = people[selectedIndexPath.row]
    }
    
}

// MARK: - Protocol subscription
extension ContactsViewController : PeopleReceiving { }

// MARK: - Table view data source
extension ContactsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let person = people[indexPath.row]
        
        content.text = person.fullName
        if let font = UIFont(name: "Impact", size: 20) {
            content.textProperties.font = font
        }
        cell.contentConfiguration = content
        
        cell.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.05)
        
        return cell
    }
}

