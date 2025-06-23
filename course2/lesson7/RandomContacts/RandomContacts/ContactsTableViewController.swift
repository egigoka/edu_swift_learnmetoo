//
//  ContactsTableViewController.swift
//  RandomContacts
//
//  Created by egigoka on 23.06.2025.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    var people: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

// MARK: - Protocol subscription
extension ContactsTableViewController : PeopleReceiving { }

// MARK: - Table view data source
extension ContactsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people.count
    }

    tableview(section)
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        let person = people[indexPath.row]
        cell.textLabel?.text = "\(person.name) \(person.surname)"
        return cell
    }
}

