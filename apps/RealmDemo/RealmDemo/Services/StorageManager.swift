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
    
//    func delete(taskLists: [TaskList]) {
//        let transaction = realm.beginAsyncWrite { [weak self] in
//            for taskList in taskLists {
//                print("delete \(taskList)")
//                self?.realm.delete(taskList)
//            }
//        }
//        transaction.commit { error in
//            if let error = error {
//                print("Error deleting data: \(error)")
//            } else {
//                print("Data deleted successfully")
//            }
//        }
//    }
    func delete(taskLists: [TaskList]) {
        realm.writeAsync({ [weak self] in
            guard let self = self else { return }
            for taskList in taskLists {
                print("delete \(taskList)")
                self.realm.delete(taskList)
            }
        }, onComplete: { error in
            if let error = error {
                print("Error deleting data: \(error)")
            } else {
                print("Data deleted successfully")
            }
        })
    }
}
