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
}

extension Contact {
    func generate() -> [Contact] {
        var contacts = [Contact]()
        
        var names = ["Alice", "Bob", "Charlie", "David", "Eve",
                     "Frank", "Grace", "Hannah", "Ivy", "Jack"]
        var surnames = ["Smith", "Johnson", "Williams", "Jones", "Brown",
                        "Davis", "Miller", "Wilson", "Moore", "Taylor"]
        
        for i in 1...10 {
            let name = names.remove(at: names.indices.randomElement() ?? 0)
            let surname = surnames.remove(at: surnames.indices.randomElement() ?? 0)
            let fullName = "\(name) \(surname)"
            
            let email = "\(fullName.lowercased())@example.com"
            
            contacts.append(Contact(id: UUID(), name: fullName, email: email))
        }
        
        return contacts
    }
}
