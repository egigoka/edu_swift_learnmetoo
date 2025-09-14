//
//  ViewController.swift
//  RealmDemo
//
//  Created by egigoka on 07.09.2025.
//

import UIKit

class TaskListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shoppingList = TaskList()
        shoppingList.name = "Shopping list"
        
        let moviesList = TaskList(value: [
            "Movies list",
            Date(),
            [["Best film ever"],
             ["The best of the best", "", Date(), true]]
        ])
        
        let milk = Task()
        milk.name = "Milk"
        milk.note = "2 l."
        
        let bread = Task(value: ["Bread", "", Date(), true])
        let apple = Task(value: ["name": "Apples", "isComplete": true])
        
        shoppingList.tasks.append(milk)
        shoppingList.tasks.insert(contentsOf: [bread, apple], at: 1)
        
        DispatchQueue.main.async {
            StorageManager.shared.save(taskLists: [shoppingList, moviesList])
        }
    }

    @IBAction func  addButtonPressed(_ sender: Any) {
        showALert()
    }
    
    @IBAction func sortingList(_ sender: UISegmentedControl) {
    }

}

extension TaskListViewController {
    
    private func showALert() {
//        let alert = AlertController(title: "New List", message: "Please insert new value", preferredStyle: .alert)
//        
//        alert.actionWIthTaskList { newValue in
//            
//        }
//        
//        present(alert, animated: true)
    }
    
}
