//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by egigoka on 01.09.2025.
//

import UIKit

class TaskListViewController: UITableViewController {

    private let cellID = "cell"
    private var tasks: [Task] = StorageManager.shared.fetchAllObjects(type: Task.self) ?? []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        view.backgroundColor = .systemBackground
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Task list"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarAppearance.backgroundColor = UIColor(
            red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 194/255
        )
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewTask)
        )
        navigationController?.navigationBar.tintColor = .white
    }

    @objc private func addNewTask () {
        showAlert(withTitle: "Add new task", andMessage: "Enter task name, pls")
    }
    
    private func showAlert(withTitle title: String,
                   andMessage message: String,
               for task: Task? = nil,
                           at indexPath: IndexPath? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            guard let taskName = alert.textFields?.first?.text, !taskName.isEmpty else { return }
            if let task = task, let indexPath = indexPath {
                self?.modifyTask(task, with: taskName, at: indexPath)
            } else {
                    self?.saveNewTask(taskName)
                }
            }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addTextField() { textField in
            textField.text = task?.name
        }
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        present(alert, animated: true)
        
    }
    
    private func saveNewTask(_ taskName: String) {
        guard let task = StorageManager.shared.newObject("Task", as: Task.self) else { return }
        let cellIndex = IndexPath(row: tasks.count, section: 0)
        
        task.name = taskName
        
        tasks.append(task)
        tableView.insertRows(at: [cellIndex], with: .automatic)
        StorageManager.shared.saveContext()
    }
    
    private func modifyTask(_ task: Task, with newName: String, at indexPath: IndexPath) {
        task.name = newName
        
        StorageManager.shared.saveContext()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    private func deleteTask(at indexPath: IndexPath) {
        let taskToDelete = tasks.remove(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .automatic)
        StorageManager.shared.delete(object: taskToDelete)
    }
}

// MARK: - Table view data source
extension TaskListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let task = tasks[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = task.name
        cell.contentConfiguration = content
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension TaskListViewController {
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, _ in
            guard let self = self else { return }
            deleteTask(at: indexPath)
        }
        
        let modifyAction = UIContextualAction(style: .normal, title: "Modify") { [weak self] _, _, _ in
            guard let self = self else { return }
            let task = self.tasks[indexPath.row]
            showAlert(withTitle: "Modify task", andMessage: "pls modify task", for: task, at: indexPath)
        }
        modifyAction.backgroundColor = .systemBlue
        return UISwipeActionsConfiguration(actions: [deleteAction, modifyAction])
    }
}
