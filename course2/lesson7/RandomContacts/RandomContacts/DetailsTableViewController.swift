//
//  DetailsViewController.swift
//  RandomContacts
//
//  Created by egigoka on 23.06.2025.
//

import UIKit

class DetailsTableViewController: UITableViewController {
    
    var people: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? PersonViewController else { return }
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        destination.person = people[selectedIndexPath.section]
    }
    
}

// MARK: - Protocol subscription
extension DetailsTableViewController : PeopleReceiving { }

// MARK: - Table view data source
extension DetailsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        people.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "\(people[section].name) \(people[section].surname)"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personIndex = indexPath.section
        let cellType = indexPath.row % 2
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactDetail", for: indexPath)
        let person = people[personIndex]
        
        var detailText = ""
        var image = UIImage(systemName: "person.fill.questionmark")
        switch cellType {
        case 0:
            detailText = person.phoneNumber
            image = UIImage(systemName: "phone")?.withTintColor(.green, renderingMode: .alwaysOriginal)
        case 1:
            detailText = person.email
            image = UIImage(systemName: "tray")?.withTintColor(.blue, renderingMode: .alwaysOriginal)
        default:
            break
        }
        
        cell.textLabel?.text = detailText
        cell.imageView?.image = image
        
        return cell
    }
}


