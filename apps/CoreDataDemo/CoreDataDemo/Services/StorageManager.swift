//
//  StorageManager.swift
//  CoreDataDemo
//
//  Created by egigoka on 07.09.2025.
//

import UIKit
import CoreData

class StorageManager {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static let shared = StorageManager()
    
    private init() {}
    
    func newObject(_ name: String) -> NSManagedObject? {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: name, in: context) else { return nil }
        let object = NSManagedObject(entity: entityDescription, insertInto: context)
        return object
    }
    
    func saveContext() {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
