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
    
    func save(taskLists: [TaskList]) {
        do {
            try realm.write {
                realm.add(taskLists)
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
