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
        showAlert()
    }
    
    private func showAlert(for task: Task? = nil,
                           completion: (() -> Void)? = nil) {
        let title = task == nil ? "Update task" : "New task"
        let message = "What do you want to do?"
        
        let alert = AlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.action(task: task) { [weak self] newValue in
            if let task = task, let completion = completion {
                StorageManager.shared.modify(task, newValue: newValue)
                completion()
            } else {
                StorageManager.shared.newObject("Task", as: Task.self) { [weak self] task in
                    task.name = newValue
                    self?.tasks.append(task)
                    self?.tableView.insertRows(
                        at: [IndexPath(row: (self?.tasks.count ?? 1) - 1, section: 0)],
                        with: .automatic)
                }
            }
        }
        
        present(alert, animated: true)
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
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, completion in
            completion(true)
            guard let self = self else { return }
            deleteTask(at: indexPath)
        }
        
        let modifyAction = UIContextualAction(style: .normal, title: "Modify") { [weak self] _, _, completion in
            completion(true)
            guard let self = self else { return }
            let task = self.tasks[indexPath.row]
            
            showAlert(for: task) {
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        modifyAction.backgroundColor = .systemBlue
        return UISwipeActionsConfiguration(actions: [deleteAction, modifyAction])
    }
}
