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
        do {
            guard let array = object[arrayKey] as? List<V> else { return }
            try realm.write {
                array.append(value)
            }
        } catch let error {
            print("Error appending to list: \(error)")
        }
    }
    
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
        
        add([newObject])
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
    
    private func add<T: Object>(_ objects: [T]) {
        do {
            try realm.write {
                realm.add(objects)
            }
        } catch let error {
            print("Error saving data: \(error)")
        }
    }

    func delete<T: Object>(_ objects: [T]) {
        do {
            try realm.write {
                realm.delete(objects)
            }
        } catch let error {
            print("Error deleting data: \(error)")
        }
    }
    
    func saveContext() {
        realm.
    }
}
