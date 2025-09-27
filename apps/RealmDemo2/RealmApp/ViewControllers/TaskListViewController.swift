//
//  TaskListsViewController.swift
//  RealmApp
//
//  Created by Alexey Efimov on 02.07.2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit
import RealmSwift

class TaskListViewController: UITableViewController {
    
    var  taskLists: Results<TaskList>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let shoppingList = TaskList()
        shoppingList.name = "Shopping List"
        
        let moviesList = TaskList(value: ["Movies List", Date(), [["Best film ever"], ["The best of the best", "", Date(), true]]])
        
        let milk = Task()
        milk.name = "Milk"
        milk.note = "2 L"
        
        let bread = Task(value: ["Bread", "", Date(), true])
        let apples = Task(value: ["name": "Apples", "isComplete": true])
        
        shoppingList.tasks.append(milk)
        shoppingList.tasks.insert(contentsOf: [bread, apples], at: 1)
         
        DispatchQueue.main.async {
            StorageManager.shared.save(taskList: [shoppingList, moviesList])
        }
        */
    
        taskLists = StorageManager.shared.realm.objects(TaskList.self)
    }
    
    @IBAction func  addButtonPressed(_ sender: Any) {
        showALert()
    }
    
    @IBAction func sortingList(_ sender: UISegmentedControl) {
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskLists.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListCell", for: indexPath)
        
        let taskList = taskLists[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = taskList.name
        content.secondaryText = "\(taskList.tasks.count)"
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let taskList = taskLists[indexPath.row]
        let tasksVC = segue.destination as! TasksViewController
        tasksVC.taskList = taskList
    }

}

extension TaskListViewController {
    
    private func showALert() {
        let alert = AlertController(title: "New List", message: "Please insert new value", preferredStyle: .alert)
        
        alert.actionWIthTaskList { newValue in
            
        }
        
        present(alert, animated: true)
    }
    
}
