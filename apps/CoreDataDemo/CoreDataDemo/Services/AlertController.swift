//
//  AlertContoller.swift
//  CoreDataDemo
//
//  Created by egigoka on 07.09.2025.
//

import UIKit

class AlertController: UIAlertController {
    
    func action(task: Task?, completion: @escaping (String) -> Void) {
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let newValue = self.textFields?.first?.text else { return }
            guard !newValue.isEmpty else { return }
            completion(newValue)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(cancelAction)
        addAction(saveAction)
        addTextField() { textField in
            textField.placeholder = "Task"
            textField.text = task?.name
        }
    }
    
}
