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
    
    func append(contact: Contact) {
        var contacts = fetchContacts()
        contacts.append(contact)
        save(contacts: contacts)
    }
    
    func fetchContacts() -> [Contact] {
        guard let data = userDefaults.object(forKey: contactKey) as? Data else { return [] }
        guard let contacts = try? JSONDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
    
    func save(contacts: [Contact]) {
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: contactKey)
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        save(contacts: contacts)
    }
}
