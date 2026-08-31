//
//  Contact.swift
//  ContactsSwiftUI
//
//  Created by egigoka2kz on 31.08.2026.
//

import Foundation

struct Contact: Identifiable {
    let id: UUID
    let name: String
    let email: String
    let phone: String
}

extension Contact {
    static func generateContacts() -> [Contact] {
        var contacts = [Contact]()
        
        var names = ["Alice", "Bob", "Charlie", "David", "Eve",
                     "Frank", "Grace", "Hannah", "Ivy", "Jack"]
        var surnames = ["Smith", "Johnson", "Williams", "Jones", "Brown",
                        "Davis", "Miller", "Wilson", "Moore", "Taylor"]
        var phones = ["123-456-7890", "234-567-8901", "345-678-9012",
                      "456-789-0123", "567-890-1234", "745-842-4567",
                      "876-543-2109", "987-654-3210", "012-345-6789",
                      "111-222-3333"]
        
        for _ in 1...10 {
            let name = names.remove(at: names.indices.randomElement() ?? 0)
            let surname = surnames.remove(at: surnames.indices.randomElement() ?? 0)
            let fullName = "\(name) \(surname)"
            
            let email = "\(fullName.lowercased())@example.com"
            let phone = phones.remove(at: phones.indices.randomElement() ?? 0)
            
            contacts.append(Contact(id: UUID(),
                                    name: fullName,
                                    email: email,
                                    phone: phone
                                   ))
        }
        
        return contacts
    }
    
    static func generateContact() -> Contact {
        Contact.generateContacts().randomElement()
            ?? Contact(id: UUID(), name: "", email: "", phone: "")
    }
}
