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
        
        let milk = Task()
        milk.name = "Milk"
        milk.note = "2 l."
        
        shoppingList.tasks.append(milk)
        
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
