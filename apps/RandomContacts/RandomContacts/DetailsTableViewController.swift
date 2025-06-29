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
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "section")
        tableView.sectionHeaderTopPadding = 0
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
    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50 // or any height you want
//    }
    
    //override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //    people[section].fullName
    //}
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView =
            tableView
                .dequeueReusableHeaderFooterView(
                    withIdentifier: "section"
                )
        guard let sectionView = sectionView else { return nil }
        
        if sectionView.backgroundView == nil {
            sectionView.backgroundView = UIView()
            }
        sectionView.backgroundView?.backgroundColor = .systemBackground
        sectionView.contentView.backgroundColor = UIColor(red: 1, green: 1, blue: 0, alpha: 0.05)
        
        var content = sectionView.defaultContentConfiguration()
        content.text = people[section].fullName
        if let font = UIFont(name: "Marker Felt", size: 23) {
            content.textProperties.font = font
        }
        
        sectionView.contentConfiguration = content
        
        return sectionView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactDetail", for: indexPath)
        
        let person = people[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            content.text = person.phoneNumber
            content.image = UIImage(systemName: "phone")?.withTintColor(.green, renderingMode: .alwaysOriginal)
            cell.backgroundColor = UIColor(red: 0, green: 1, blue: 1, alpha: 0.05)
        default:
            content.text = person.email
            content.image = UIImage(systemName: "tray")?.withTintColor(.blue, renderingMode: .alwaysOriginal)
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.05)
        }

        cell.contentConfiguration = content

        return cell
    }
}


