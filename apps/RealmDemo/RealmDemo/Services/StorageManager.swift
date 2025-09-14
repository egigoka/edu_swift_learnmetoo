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
    
    func appendToList<T: Object>(_ 
    
    func createNew<T: Object>(_ type: T.Type, value: [String: Any] = [:]) -> T {
        let ID = ObjectId.generate()
        var value = value
        var newObject = T()
        
        value.updateValue(ID, forKey: "_id")
        do {
            try realm.write {
                newObject = realm.create(type, value: value)
            }
        } catch let error {
            print("Error writing new object: \(error)")
        }
        
        create([newObject])
        return newObject
    }
    
    func update<T: Object>(_ object: T?, value: [String: Any] = [:]) {
        guard let object = object else { return }
        do {
            try realm.write {
                for (key, value) in value {
                    object.setValue(value, forKey: key)
                }
            }
        } catch let error {
            print("Error while updating \(object): \n\(error)")
        }
    }
    
    private func create<T: Object>(_ objects: [T]) {
        do {
            try realm.write {
                realm.add(objects)
            }
        } catch let error {
            print("Error saving data: \(error)")
        }
    }

    func delete(taskLists: [TaskList]) {
        do {
            try realm.write {
                realm.delete(taskLists)
            }
        } catch let error {
            print("Error deleting data: \(error)")
        }
    }
}
