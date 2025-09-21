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
    
    func alert<T: Object>(for type: T.Type,
                          _ object: Object? = nil,
                          in taskListParent: TaskList? = nil) {

    let task = object as? Task
    let taskList = object as? TaskList
    let isTask = task == nil
        
        let title = object == nil ? "Add Task\(isTask ? "" : " List")" : "Edit Task\(isTask ? "" : " List")"
        let message = object == nil ? "Enter a name for your new task\(isTask ? "" : " list")." : "Edit the name of your task\(isTask ? "" : " list")."
        let buttonTitle = object == nil ? "Add" : "Save"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Task\(isTask ? "" : " List") Name"
            if let task = task {
                textField.text = task.name
            }
        if let taskList = taskList {
            textField.text = taskList.name
        }
        }
        
    if isTask {
            alert.addTextField { TextField in
            TextField.placeholder = "Note"
                if let task = task {
                    TextField.text = task.note
                }
            }
    }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let addAction = UIAlertAction(title: buttonTitle, style: .default) { alertAction in
            guard let name = alert.textFields?.first?.text else { return }
            let note = alert.textFields?[1].text ?? ""
            var task = task
            if task == nil {
                task = StorageManager.shared.createNew(Task.self, value: ["name": name, "note": note])
                guard let task = task, let taskListParent = taskListParent else { return }
                StorageManager.shared.appendToList(taskListParent, to: "tasks", with: task)
            } else {
                StorageManager.shared.update(task, value: ["name": name, "note": note])
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        
        present(alert, animated: true)
    }
}
