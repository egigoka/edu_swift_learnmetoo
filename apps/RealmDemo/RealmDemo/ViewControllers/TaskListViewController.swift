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

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        guard let shoppingListID = try? ObjectId(string: "68c6720778fd1ce3aa44f812") else { return }
//        guard let moviesListID = try? ObjectId(string: "68c6720778fd1ce3aa44f813") else { return }
//        
//        guard let movieBFEID = try? ObjectId(string: "68c6720778fd1ce3aa44f814") else { return }
//        guard let movieTBOFBID = try? ObjectId(string: "68c6720778fd1ce3aa44f815") else { return }
//        guard let milkID = try? ObjectId(string: "68c6720778fd1ce3aa44f816") else { return }
//        guard let breadID = try? ObjectId(string: "68c6720778fd1ce3aa44f817") else { return }
//        guard let appleID = try? ObjectId(string: "68c6720778fd1ce3aa44f818") else { return }
//        
//        let shoppingList = TaskList()
//        shoppingList._id = shoppingListID
//        shoppingList.name = "Shopping list"
//        
//        let moviesList = TaskList(value: [
//            moviesListID,
//            "Movies list",
//            Date(),
//            [[movieBFEID, "Best film ever"],
//             [movieTBOFBID, "The best of the best", "", Date(), true]]
//        ])
//        
//        let milk = Task()
//        milk._id = milkID
//        milk.name = "Milk"
//        milk.note = "2 l."
//        
//        let bread = Task(value: [breadID, "Bread", "", Date(), true])
//        let apple = Task(value: ["_id": appleID, "name": "Apples", "isComplete": true])
//        
//        shoppingList.tasks.append(milk)
//        shoppingList.tasks.insert(contentsOf: [bread, apple], at: 1)
//        
//        DispatchQueue.main.async {
//            StorageManager.shared.save(taskLists: [shoppingList, moviesList])
//        }
        
        tasksLists = StorageManager.shared.realm.objects(TaskList.self)
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
                
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
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
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] alertAction in
            guard let name = alert.textFields?.first?.text else { return }
            let newTaskListID = ObjectId.generate()
            let newTaskList = TaskList(value: ["_id": newTaskListID, "name": name])
            StorageManager.shared.save(taskLists: [newTaskList])
            DispatchQueue.main.async {
                if let tasksListsCount = self?.tasksLists.count {
                    let indexPath = IndexPath(row: tasksListsCount - 1, section: 0)
                    self?.tableView.reloadRows(at: [], with: .automatic)
                } else {
                    self?.tableView.reloadData()
                    print("something went wrong while reloading data")
                }
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        
        present(alert, animated: true)
    }
    
    
}
