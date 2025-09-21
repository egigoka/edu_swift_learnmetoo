//
//  TableViewController.swift
//  test
//
//  Created by egigoka on 21.09.2025.
//

import UIKit

class TableViewController: UITableViewController {

    var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 1...100 {
            data.append(String(1))
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        var conf = cell.defaultContentConfiguration()
        
        conf.text = data[indexPath.row]
        
        cell.contentConfiguration = conf

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        deleteAction.image = UIImage(systemName: "trash")
        
        let editAction = UIContextualAction(style: .normal, title: nil) { [weak self] action, _, completion in
            guard let taskList = self?.tasksLists[indexPath.row] else {
                print("cannot edit")
                completion(false)
                return
            }
            
            self?.present(AlertController.generate(for: TaskList.self, taskList), animated: true)
            
            completion(true)
        }
        editAction.image = UIImage(systemName: "pencil")
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

}
