//
//  AlertController.swift
//  RealmDemo
//
//  Created by egigoka on 14.09.2025.
//

import UIKit
import RealmSwift

class AlertController: UIAlertController {
    func generate() {
        
    }
    
    func alert<T: Object>(for type: T.Type, _ object: Object? = nil) {

        let task = object as? T
        let taskList = object as? TaskList
            
            let title = task == nil ? "Add Task" : "Edit Task"
            let message = task == nil ? "Enter a name for your new task." : "Edit the name of your task."
            let buttonTitle = task == nil ? "Add" : "Save"
            
            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert)
            
            alert.addTextField { textField in
                textField.placeholder = "Task Name"
                if let task = task {
                    textField.text = task.name
                }
            }
            
            alert.addTextField { TextField in
                TextField.placeholder = "Note"
                if let task = task {
                    TextField.text = task.note
                }
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            let addAction = UIAlertAction(title: buttonTitle, style: .default) { [weak self] alertAction in
                guard let name = alert.textFields?.first?.text else { return }
                let note = alert.textFields?[1].text ?? ""
                var task = task
                if task == nil {
                    task = StorageManager.shared.createNew(Task.self, value: ["name": name, "note": note])
                    guard let task = task, let taskList = self?.taskList else { return }
                    StorageManager.shared.appendToList(taskList, to: "tasks", with: task)
                } else {
                    StorageManager.shared.update(task, value: ["name": name, "note": note])
                }
            }
            
            alert.addAction(cancelAction)
            alert.addAction(addAction)
            
            present(alert, animated: true)
        }
}
