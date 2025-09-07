//
//  StorageManager.swift
//  CoreDataDemo
//
//  Created by egigoka on 07.09.2025.
//

import CoreData

class StorageManager {
    
    static let shared = StorageManager()
    
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {}
    
    func newObject<T: NSManagedObject>(_ name: String, as type: T.Type) -> T? {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: name, in: context) else { return nil }
        guard let object = NSManagedObject(entity: entityDescription, insertInto: context) as? T else { return nil }
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
    
    func fetchAllObjects<T: NSManagedObject>(type: T.Type) -> [T]? {
        let fetchRequest = type.fetchRequest()
        
        do {
            return try context.fetch(fetchRequest) as? [T]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func delete(object: NSManagedObject) {
        context.delete(object)
        saveContext()
    }
}
