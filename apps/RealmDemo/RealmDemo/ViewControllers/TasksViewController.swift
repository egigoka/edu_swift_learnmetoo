//
//  TasksViewController.swift
//  RealmDemo
//
//  Created by egigoka on 07.09.2025.
//

import UIKit
import RealmSwift

class TasksViewController: RealmTableViewController {
    
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
        
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        
        navigationItem.rightBarButtonItems = [addButtonItem, editButtonItem]
        
        currentTasks = taskList.tasks
            .filter("isComplete = false")
            .sorted(byKeyPath: "name", ascending: true)
        completedTasks = taskList.tasks
            .filter("isComplete = true")
            .sorted(byKeyPath: "name", ascending: true)
        
        notificationTokenCurrent = currentTasks.observe { [weak self] changes in
            self?.updateTableView(changes, section: 0)
        }
        
        notificationTokenCompleted = completedTasks.observe({ [weak self] changes in
            self?.updateTableView(changes, section: 1)
        })
    }
    
    @objc private func addButtonPressed() {
        present(AlertController.generate(for: Task.self, nil, in: taskList), animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        present(AlertController.generate(for: Task.self, nil, in: taskList), animated: true)
    }
    
}

// MARK: - UITableViewDataSource
extension TasksViewController {
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
}

// MARK: - UITableViewDelegate
extension TasksViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = (indexPath.section == 0 ? currentTasks : completedTasks)[indexPath.row]
        
        present(AlertController.generate(for: Task.self, task, in: taskList), animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] _, _, completion in
            completion(true)
            
            guard let self = self else { return }
            
            let task = (indexPath.section == 0 ? self.currentTasks : self.completedTasks)[indexPath.row]
            
            StorageManager.shared.delete([task])
        }
        deleteAction.image = UIImage(systemName: "trash")
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeAction = UIContextualAction(style: .normal, title: nil) { [weak self] _, _, completion in
            completion(true)
            
            guard let self = self else { return }
            
            let task = (indexPath.section == 0 ? self.currentTasks : self.completedTasks)[indexPath.row]
            
            StorageManager.shared.update(task, value: ["isComplete": !(task.isComplete)])
        }
        completeAction.backgroundColor = indexPath.section == 0 ? .systemGreen : .systemRed
        completeAction.image = UIImage(systemName: indexPath.section == 0 ? "checkmark" : "xmark")
        
        return UISwipeActionsConfiguration(actions: [completeAction])
    }
}
