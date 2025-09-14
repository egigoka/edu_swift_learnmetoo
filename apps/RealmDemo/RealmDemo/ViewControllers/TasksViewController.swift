//
//  TasksViewController.swift
//  RealmDemo
//
//  Created by egigoka on 07.09.2025.
//

import UIKit

class TasksViewController: UITableViewController {
    
    var taskList: TaskList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = taskList.name
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        //guard let task = taskList[indexPath.row] as? Task else { return cell }
        //content.text = taskList[indexPath.row].name
        
        
        return cell
    }
    
}
