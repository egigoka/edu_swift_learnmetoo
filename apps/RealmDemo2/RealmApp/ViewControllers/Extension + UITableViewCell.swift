//
//  Extension + UITableViewCell.swift
//  RealmApp
//
//  Created by egigoka on 28.09.2025.
//  Copyright © 2025 Alexey Efimov. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func configure(with taskList: TaskList) {
        let currentTasks = taskList.tasks.filter("isComplete == false")
        let completedTasks = taskList.tasks.filter("isComplete == true")
        
        var content = defaultContentConfiguration()
        content.text = taskList.name
        
        if !currentTasks.isEmpty {
            content.secondaryText = "\(currentTasks.count)"
            accessoryType = .none
        } else if !completedTasks.isEmpty {
            content.secondaryText = nil
            accessoryType = .checkmark
        } else {
            content.secondaryText = "0"
            accessoryType = .none
        }
        
        contentConfiguration = content
    }
}
