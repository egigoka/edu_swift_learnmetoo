//
//  ViewController.swift
//  RealmDemo
//
//  Created by egigoka on 07.09.2025.
//

import UIKit
import RealmSwift

class TaskListViewController: UITableViewController {
    
    var tasksLists: Results<TaskList>!

    var notificationToken: NotificationToken?
    
    deinit {
        notificationToken?.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasksLists = StorageManager.shared.realm.objects(TaskList.self)
        
        notificationToken = tasksLists.observe { [weak self] changes in
            self?.updateTableView(with: changes, inSection: 0)
        }
    }

    @IBAction func  addButtonPressed(_ sender: Any) {
        addTaskList()
    }
    
    @IBAction func sortingList(_ sender: UISegmentedControl) {
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasksLists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListCell", for: indexPath)
        
        let taskList = tasksLists[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = taskList.name
        content.secondaryText = "\(taskList.tasks.count)"
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let taskList = tasksLists[indexPath.row]
        
        let tasksVC = segue.destination as! TasksViewController
        
        tasksVC.taskList = taskList
        
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] action, view, completionHandler in
            
            action.image = UIImage(systemName: "trash.fill")
            action.title = nil
            
            if let taskList = self?.tasksLists[indexPath.row] {
                StorageManager.shared.delete(taskLists: [taskList])
                
                completionHandler(true)
            } else {
                print("cannot delete")
                completionHandler(false)
            }
        }
        deleteAction.image = UIImage(systemName: "trash")
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

}

extension TaskListViewController {
    
    private func addTaskList() {
        let alert = UIAlertController(
            title: "Add Task List",
            message: "Enter a name for your new task list",
            preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Task List Name"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let addAction = UIAlertAction(title: "Add", style: .default) { alertAction in
            guard let name = alert.textFields?.first?.text else { return }
            let newTaskListID = ObjectId.generate()
            let newTaskList = TaskList(value: ["_id": newTaskListID, "name": name])
            StorageManager.shared.save(taskLists: [newTaskList])
        }
        
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        
        present(alert, animated: true)
    }
    
    
}
