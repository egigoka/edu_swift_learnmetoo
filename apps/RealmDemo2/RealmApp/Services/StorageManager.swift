//
//  StorageManager.swift
//  RealmApp
//
//  Created by Alexey Efimov on 26.11.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    let realm = try! Realm()
    
    private init() {}
    
    // MARK: - TaskList methods
    func save(taskList: TaskList) {
        write {
            realm.add(taskList)
        }
    }
    
    func delete(taskList: TaskList) {
        write {
            let tasks = taskList.tasks
            realm.delete(tasks)
            realm.delete(taskList)
        }
    }
    
    // MARK: - Task methods
    func save(task: Task, in taskList: TaskList) {
        write {
            taskList.tasks.append(task)
        }
    }
    
    
    
    private func write(_ completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch let error {
            print(error)
        }
    }
}
