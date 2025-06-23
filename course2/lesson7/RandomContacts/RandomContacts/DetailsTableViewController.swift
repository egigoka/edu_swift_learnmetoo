//
//  DetailsViewController.swift
//  RandomContacts
//
//  Created by egigoka on 23.06.2025.
//

import UIKit

class DetailsTableViewController: UITableViewController {
    
    let a = print("GRUG HERE")
    
    var people: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("grug here")

        print("people.count detail = \(people.count)")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people.count * 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personIndex = indexPath.row / 3
        let cellType = indexPath.row % 3
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactDetail", for: indexPath)
        let person = people[personIndex]
        
        var detailText = ""
        switch cellType {
        case 0:
            detailText = "\(person.name) \(person.surname)"
        case 1:
            detailText = person.email
        case 2:
            detailText = person.phoneNumber
        default:
            break
        }
        
        cell.textLabel?.text = detailText
        
        return cell
    }
    
}

extension DetailsTableViewController : PeopleReceiving { }

