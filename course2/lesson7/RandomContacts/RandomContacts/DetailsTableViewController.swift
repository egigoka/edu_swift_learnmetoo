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
//        let personIndex = indexPath.row / 3
//        let cellType = indexPath.row % 3
        let personIndex = indexPath.section
        let cellType = indexPath.row % 2
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactDetail", for: indexPath)
        let person = people[personIndex]
        
        var detailText = ""
        switch cellType {
        case 0:
            //detailText = "\(person.name) \(person.surname)"
            detailText = person.email
        case 1:
            detailText = person.phoneNumber
//        case 2:
//            detailText = person.phoneNumber
        default:
            break
        }
        
        cell.textLabel?.text = detailText
        
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? PersonViewController else { return }
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        destination.person = people[selectedIndexPath.row]
    }
}


// MARK: - Table view data source


