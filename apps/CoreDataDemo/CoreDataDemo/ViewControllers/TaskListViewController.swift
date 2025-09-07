//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by egigoka on 01.09.2025.
//

import UIKit

class TaskListViewController: UITableViewController {

    private let cellID = "cell"
    private var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        view.backgroundColor = .systemBackground
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
        tableView.reloadData()
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
        //let newTaskVC = NewTaskViewController()
        //newTaskVC.modalPresentationStyle = .fullScreen
        //present(newTaskVC, animated: true)
        showAlertNewTask(withTitle: "Add new task", andMessage: "Enter task name, pls")
    }
    
    private func fetchData() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            tasks = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    private func showAlertNewTask(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            guard let task = alert.textFields?.first?.text, !task.isEmpty else { return }
            self?.saveNewTask(task)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    private func showAlertModifyTask(for task: Task,
                                     withTitle title: String,
                                     andMessage message: String,
                                     at indexPath: IndexPath) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            guard let newTaskName = alert.textFields?.first?.text, !newTaskName.isEmpty else { return }
            task.name = newTaskName
            self?.save()
            self?.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addTextField() { textField in
            textField.text = task.name
        }
        alert.addAction(saveAction)
        alert.addAction(cancelButton)
        
        present(alert, animated: true)
        
    }
    
    private func saveNewTask(_ taskName: String) {
        guard let task = StorageManager.shared.newObject("Task") as? Task else { return }
        
        task.name = taskName
        tasks.append(task)
        
        let cellIndex = IndexPath(row: tasks.count - 1, section: 0)
        
        tableView.insertRows(at: [cellIndex], with: .automatic)
        
        save()
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let taskToDelete = tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            context.delete(taskToDelete)
        }
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, _ in
            guard let self = self else { return }
            let taskToDelete = self.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            context.delete(taskToDelete)
        }
        
        let modifyAction = UIContextualAction(style: .normal, title: "Modify") { [weak self] _, _, _ in
            guard let self = self else { return }
            let task = self.tasks[indexPath.row]
            showAlertModifyTask(for: task, withTitle: "Modify task", andMessage: "pls modify task", at: indexPath)
        }
        modifyAction.backgroundColor = .systemBlue
        return UISwipeActionsConfiguration(actions: [modifyAction, deleteAction])
    }
}
