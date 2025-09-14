//
//  TasksViewController.swift
//  RealmDemo
//
//  Created by egigoka on 07.09.2025.
//

import UIKit
import RealmSwift

class TasksViewController: UITableViewController {
    
    var taskList: TaskList!
    
    var currentTasks: Results<Task>!
    var completedTasks: Results<Task>!
    
    var notificationTokenCurrent: NotificationToken?
    var notificationTokenCompleted: NotificationToken?
    
    deinit {
        notificationTokenCurrent?.invalidate()
        notificationTokenCompleted?.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = taskList.name
        
        currentTasks = taskList.tasks.filter("isComplete = false")
        completedTasks = taskList.tasks.filter("isComplete = true")
        
        notificationTokenCurrent = currentTasks.observe { [weak self] changes in
            self?.updateTableView(with: changes, inSection: 0)
        }
        
        notificationTokenCompleted = completedTasks.observe({ [weak self] changes in
            self?.updateTableView(with: changes, inSection: 1)
        })
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? currentTasks.count : completedTasks.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "CURRENT TASKS" : "COMPLETED TASKS"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath)
        
        let task = indexPath.section == 0 ? currentTasks[indexPath.row] : completedTasks[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = task.name
        content.secondaryText = task.note
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - IBActions
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        alertTask()
    }
    
}

extension TasksViewController {
    
    private func alertTask(_ task: Task? = nil) {
        
        let title = task == nil ? "Add Task" : "Edit Task"
        let message = task == nil ? "Enter a name for your new task." : "Edit the name of your task."
        let buttonTitle = task == nil ? "Add" : "Save"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Task Name"
            if let task = task {
                textField.text = task.name
            }
        }
        
        alert.addTextField { TextField in
            TextField.placeholder = "Note"
            if let task = task {
                TextField.text = task.note
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let addAction = UIAlertAction(title: buttonTitle, style: .default) { alertAction in
            guard let name = alert.textFields?.first?.text else { return }
            let note = alert.textFields?[1].text ?? ""
            if task == nil {
                StorageManager.shared.createNew(TaskList.self, value: ["name": name, "note": note])
            } else {
                StorageManager.shared.update(task, value: ["name": name, "note": note])
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        
        present(alert, animated: true)
    }
}
