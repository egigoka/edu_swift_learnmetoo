//
//  StorageManager.swift
//  RealmDemo
//
//  Created by egigoka on 07.09.2025.
//

import Foundation
import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    let realm = try! Realm()
    
    private init() {}
    
    func appendToList<T: Object, V: Object>(_ object: T, to arrayKey: String, with value: V) {
        guard let array = object[arrayKey] as? List<V> else { return }
        write {
            array.append(value)
        }
    }
    
    func createNew<T: Object>(_ type: T.Type, value: [String: Any] = [:]) -> T {
        let ID = ObjectId.generate()
        var value = value
        var newObject = T()
        
        value.updateValue(ID, forKey: "_id")
        write {
            newObject = realm.create(type, value: value)
        }
        
        add([newObject])
        return newObject
    }
    
    func update<T: Object>(_ object: T?, value: [String: Any] = [:]) {
        guard let object = object else { return }
        write {
            for (key, value) in value {
                object.setValue(value, forKey: key)
            }
        }
    }
    
    private func add<T: Object>(_ objects: [T]) {
        write {
            realm.add(objects)
        }
    }
    
    func delete(taskList: TaskList) {
        write {
            realm.delete(taskList.tasks)
            realm.delete(taskList)
        }
    }
    
    func delete<T: Object>(_ objects: [T]) {
        write {
            realm.delete(objects)
        }
    }
    
    func cleanup() {
        let allTasks = realm.objects(Task.self)
        let allTaskLists = realm.objects(TaskList.self)
        var usedTasks: [Task] = []
        
        print("Total tasks: \(allTasks.count)")
        
        for taskList in allTaskLists {
            for task in taskList.tasks {
                usedTasks.append(task)
            }
        }
        
        print("Tasks in Task lists: \(usedTasks.count)")
        
        if allTasks.count == usedTasks.count { return }
        
        write {
            for task in allTasks {
                if usedTasks.contains(task) { continue }
                realm.delete(task)
            }
        }
        
        print("cleanup completed")
    }
    
    private func write(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch let error {
            print(error)
            fatalError(String(describing: error))
        }
    }
}
