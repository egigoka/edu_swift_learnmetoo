//
//  Person.swift
//  ContactsSwiftUI
//
//  Created by egigoka on 09.11.2025.
//
import Foundation

struct Person: Identifiable {
    let id: String
    let name: String
    let surname: String
    let phone: String
    let email: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension Person {
    static func generateContacts() -> [Person] {
        let dataManager = DataManager.shared
        var names = dataManager.names
        var surnames = dataManager.surnames
        var phones = dataManager.phones
        var emails = dataManager.emails
        
        var persons: [Person] = []
        
        for _ in 0..<names.count {
            persons.append(Person(
                id: UUID().uuidString,
                name: names.remove(at: Int.random(in: 0..<names.count)),
                surname: surnames.remove(at: Int.random(in: 0..<surnames.count)),
                phone: phones.remove(at: Int.random(in: 0..<phones.count)),
                email: emails.remove(at: Int.random(in: 0..<emails.count))
            ))
        }
        
        return persons
    }
    
    static func generateContact() -> Person {
        let dataManager = DataManager.shared
        let names = dataManager.names
        let surnames = dataManager.surnames
        let phones = dataManager.phones
        let emails = dataManager.emails
        
        return Person(
            id: UUID().uuidString,
            name: names[Int.random(in: 0..<names.count)],
            surname: surnames[Int.random(in: 0..<surnames.count)],
            phone: phones[Int.random(in: 0..<phones.count)],
            email: emails[Int.random(in: 0..<emails.count)]
        )
    }
}
