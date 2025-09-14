//
//  ViewController.swift
//  RealmDemo
//
//  Created by egigoka on 07.09.2025.
//

import UIKit
import RealmSwift

class TaskListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let shoppingListID = try? ObjectId(string: "60c8e2a4a7b8c9d0e1f2g3h8") else { return }
        guard let moviesListID = try? ObjectId(string: "60c8e2a4a7b8c9d0e1f2g3h4") else { return }
        
        guard let movieBFEID = try? ObjectId(string: "60c8e2a4a7b8c9d0e1f2g3h5") else { return }
        guard let movieTBOFBID = try? ObjectId(string: "60c8e2a4a7b8c9d0e1f2g3h6") else { return }
        guard let milkID = try? ObjectId(string: "60c8e2a4a7b8c9d0e1f2g3h9") else { return }
        guard let breadID = try? ObjectId(string: "60c8e2a4a7b8c9d0e1f2g3h7") else { return }
        guard let appleID = try? ObjectId(string: "60c8e2a4a7b8c9d0e1f2g3ha") else { return }
        
        
        let shoppingList = TaskList()
        shoppingList._id = shoppingListID
        shoppingList.name = "Shopping list"
        
        let moviesList = TaskList(value: [
            moviesListID,
            "Movies list",
            Date(),
            [[movieBFEID, "Best film ever"],
             [movieTBOFBID, "The best of the best", "", Date(), true]]
        ])
        
        let milk = Task()
        milk._id = milkID
        milk.name = "Milk"
        milk.note = "2 l."
        
        let bread = Task(value: [breadID, "Bread", "", Date(), true])
        let apple = Task(value: ["_id": appleID, "name": "Apples", "isComplete": true])
        
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
