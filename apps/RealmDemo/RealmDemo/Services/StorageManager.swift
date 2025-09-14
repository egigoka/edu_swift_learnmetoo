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
        let references = taskLists.map { ThreadSafeReference(to: $0) }
        try! realm.write {
            for ref in references {
                if let resolved = realm.resolve(ref) {
                    realm.add(resolved)
                } else {
                    print("reference not resolved \(ref)")
                }
            }
        }
    }
}
