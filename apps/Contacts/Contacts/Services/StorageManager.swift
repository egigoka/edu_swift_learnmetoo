//
//  StorageManager.swift
//  Contacts
//
//  Created by egigoka on 31.08.2025.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let contactKey = "contacts"
    private let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    private var archiveUrl: URL
    
    private init() {
        //print(documentDirectory)
        archiveUrl = documentDirectory.appendingPathComponent("Contacts").appendingPathExtension("plist")
    }
    
    func append(contact: Contact) {
        var contacts = fetchContacts()
        contacts.append(contact)
        save(contacts: contacts)
    }
    
    func appendToFile(with contact: Contact) {
        var contacts = fetchContactsFromFile()
        contacts.append(contact)
        saveToFile(contacts: contacts)
    }
    
    func fetchContacts() -> [Contact] {
        guard let data = userDefaults.object(forKey: contactKey) as? Data else { return [] }
        guard let contacts = try? JSONDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
    
    func fetchContactsFromFile() -> [Contact] {
        guard let data = try? Data(contentsOf: archiveUrl) else { return [] }
        guard let contacts: [Contact] = try? PropertyListDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
    
    func save(contacts: [Contact]) {
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: contactKey)
    }
    
    func saveToFile(contacts: [Contact]) {
        guard let data = try? PropertyListEncoder().encode(contacts) else { return }
        try? data.write(to: archiveUrl, options: .noFileProtection)
    }
    
    func delete(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        save(contacts: contacts)
    }
    
    func deleteFromFile(at index: Int) {
        var contacts = fetchContactsFromFile()
        contacts.remove(at: index)
        saveToFile(contacts: contacts)
    }
}
