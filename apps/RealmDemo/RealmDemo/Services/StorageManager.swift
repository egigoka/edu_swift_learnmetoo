//
//  StorageManager.swift
//  RealmDemo
//
//  Created by egigoka on 07.09.2025.
//

import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    private let realm = try! Realm()
    
    private init() {}
    
    func save(taskLists: [TaskList]) {
        try! realm.write {
            realm.add(taskLists)
        }
    }
}
