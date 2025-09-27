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
        
        navigationController?.interactivePopGestureRecognizer?.require(toFail: tableView.panGestureRecognizer)
        
//        //debug
//        for i in 1...10 {
//            let _ = StorageManager.shared.createNew(TaskList.self, value: ["name": String(i)])
//        }
//        //debug END
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
        present(AlertController.generate(for: TaskList.self), animated: true)
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
    
    // MARK: - Navigation
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
        let currentTasks = (taskList.tasks.filter { !$0.isComplete }).count
        let completedTasks = taskList.tasks.count - currentTasks
        
        var content = cell.defaultContentConfiguration()
        
        content.text = taskList.name
        
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "checkmark")?.withTintColor(.systemBlue)
        let imageString = NSAttributedString(attachment: imageAttachment)
        
        if currentTasks == 0 && completedTasks != 0 {
            content.secondaryAttributedText = imageString
        } else {
            content.secondaryText = "\(currentTasks)"
        }
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
            
            self?.present(AlertController.generate(for: TaskList.self, taskList), animated: true)
            
            completion(true)
        }
        editAction.image = UIImage(systemName: "pencil")
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}
