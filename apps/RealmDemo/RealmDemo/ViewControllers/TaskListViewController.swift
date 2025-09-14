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
