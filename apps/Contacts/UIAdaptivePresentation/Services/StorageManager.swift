//
//  StorageManager.swift
//  UIAdaptivePresentation
//
//  Created by Alexey Efimov on 19.11.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let contactKey = "contacts"
    private let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    private var archiveURL: URL
    
    private init() {
        archiveURL = documentDirectory.appendingPathComponent("Contacts").appendingPathExtension("plist")
    }
    
    /*
    func save(contact: String) {
        var contacts = fetchContacts()
        contacts.append(contact)
        userDefaults.set(contacts, forKey: contactKey)
    }
    
    func fetchContacts() -> [String] {
        if let contacts = userDefaults.value(forKey: contactKey) as? [String] {
            return contacts
        }
        
        return []
    }
    
    func delete(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        userDefaults.set(contacts, forKey: contactKey)
    }
    */

    func save(contact: Contact) {
        var contacts = fetchContacts()
        contacts.append(contact)
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: contactKey)
    }
    
    func saveToFile(with contact: Contact) {
        var contacts = fetchFromFile()
        contacts.append(contact)
        guard let data = try? PropertyListEncoder().encode(contacts) else { return }
        try? data.write(to: archiveURL, options: .noFileProtection)
    }
    
    func fetchContacts() -> [Contact] {
        guard let data = userDefaults.object(forKey: contactKey) as? Data else { return [] }
        guard let contacts = try? JSONDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
    
    func fetchFromFile() -> [Contact] {
        guard let data = try? Data(contentsOf: archiveURL) else { return [] }
        guard let contacts = try? PropertyListDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
    
    func delete(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: contactKey)
    }
    
    func deleteFromFile(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        guard let data = try? PropertyListEncoder().encode(contacts) else { return }
        try? data.write(to: archiveURL, options: .noFileProtection)
    }
}
