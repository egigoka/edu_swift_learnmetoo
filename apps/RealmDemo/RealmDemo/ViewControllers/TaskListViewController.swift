//
//  ViewController.swift
//  RealmDemo
//
//  Created by egigoka on 07.09.2025.
//

import UIKit
import RealmSwift

class TaskListViewController: RealmTableViewController {
    
    var tasksLists: Results<TaskList>!

    var notificationToken: NotificationToken?
    
    deinit {
        notificationToken?.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData(sortingBy: "name")
    }
    
    private func reloadData(sortingBy: String) {
        notificationToken?.invalidate()
        
        tasksLists = StorageManager.shared.realm.objects(TaskList.self)
            .sorted(byKeyPath: sortingBy)
        
        notificationToken = tasksLists.observe { [weak self] changes in
            self?.updateTableView(changes, section: 0)
        }
        
        tableView.reloadData()
    }

    @IBAction func  addButtonPressed(_ sender: Any) {
        alertTaskList()
    }
    
    @IBAction func sortingList(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: // A-Z
            reloadData(sortingBy: "name")
        case 1: // Date
            reloadData(sortingBy: "date")
        default:
            fatalError()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let taskList = tasksLists[indexPath.row]
        
        let tasksVC = segue.destination as! TasksViewController
        
        tasksVC.taskList = taskList
    }
    
}

// MARK: - UITableViewDataSource
extension TaskListViewController {
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
}

// MARK: - UITableViewDelegate
extension TaskListViewController {
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] action, _, completion in
            guard let taskList = self?.tasksLists[indexPath.row] else {
                print("cannot delete")
                completion(false)
                return
            }
            
            StorageManager.shared.delete([taskList])
            
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        
        let editAction = UIContextualAction(style: .normal, title: nil) { [weak self] action, _, completion in
            guard let taskList = self?.tasksLists[indexPath.row] else {
                print("cannot edit")
                completion(false)
                return
            }
            
            self?.alertTaskList(taskList)
            
            completion(true)
        }
        editAction.image = UIImage(systemName: "pencil")
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}

// MARK: - Alert
extension TaskListViewController {
    
    private func alertTaskList(_ taskList: TaskList? = nil) {
        
        let title = taskList == nil ? "Add Task List" : "Edit Task List"
        let message = taskList == nil ? "Enter a name for your new task list." : "Edit the name of your task list."
        let buttonTitle = taskList == nil ? "Add" : "Save"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Task List Name"
            if let taskList = taskList {
                textField.text = taskList.name
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let addAction = UIAlertAction(title: buttonTitle, style: .default) { alertAction in
            guard let name = alert.textFields?.first?.text else { return }
            if taskList == nil {
                let _ = StorageManager.shared.createNew(TaskList.self, value: ["name": name])
            } else {
                guard let taskList = taskList else { return }
                StorageManager.shared.update(taskList, value: ["name": name])
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        
        present(alert, animated: true)
    }
}
