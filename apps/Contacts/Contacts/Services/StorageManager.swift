//
//  StorageManager.swift
//  Contacts
//
//  Created by egigoka on 31.08.2025.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    private let userDefaults = UserDefaults.standard
    private let contactKey = "contacts"
    
    func append(contact: String) {
        var contacts = fetchContacts()
        contacts.append(contact)
        save(contacts: contacts)
    }
    
    func fetchContacts() -> [String] {
        if let contacts = userDefaults.value(forKey: contactKey) as? [String] {
            return contacts
        }
        return []
    }
    
    func save(contacts: [String]) {
        userDefaults.set(contacts, forKey: contactKey)
    }
    
    func delete(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        save(contacts: contacts)
    }
}
