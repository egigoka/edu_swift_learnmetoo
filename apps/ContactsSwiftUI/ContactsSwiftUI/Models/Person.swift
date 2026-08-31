//
//  Person.swift
//  ContactsSwiftUI
//
//  Created by egigoka2kz on 31.08.2026.
//

import Foundation

struct Person: Identifiable {
    let id: UUID
    let name: String
    let email: String
    let phone: String
}

extension Person {
    static func generateContacts() -> [Person] {
        var contacts = [Person]()
        
        var names = DataManager.shared.names
        var surnames = DataManager.shared.surnames
        var phones = DataManager.shared.phones
        
        for _ in 1...10 {
            let name = names.remove(at: names.indices.randomElement() ?? 0)
            let surname = surnames.remove(at: surnames.indices.randomElement() ?? 0)
            let fullName = "\(name) \(surname)"
            
            let email = "\(fullName.lowercased())@example.com"
            let phone = phones.remove(at: phones.indices.randomElement() ?? 0)
            
            contacts.append(Person(id: UUID(),
                                    name: fullName,
                                    email: email,
                                    phone: phone
                                   ))
        }
        
        return contacts
    }
    
    static func generateContact() -> Person {
        Person.generateContacts().randomElement()
            ?? Person(id: UUID(), name: "", email: "", phone: "")
    }
}
