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
    
    func save(taskList: [TaskList]) {
        try! realm.write {
            realm.add(taskList)
        }
    }
}
