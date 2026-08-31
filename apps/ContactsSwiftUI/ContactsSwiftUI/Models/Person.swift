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
        
        let names = DataManager.shared.names.shuffled()
        let surnames = DataManager.shared.surnames.shuffled()
        let phones = DataManager.shared.phones.shuffled()
        
        for index in 0..<names.count {
            let name = names[index]
            let surname = surnames[index]
            let fullName = "\(name) \(surname)"
            
            let email = "\(fullName.lowercased())@example.com"
            let phone = phones[index]
            
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
