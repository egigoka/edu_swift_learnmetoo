//
//  Person.swift
//  ContactsSwiftUI
//
//  Created by egigoka on 09.11.2025.
//

struct Person: Identifiable, Hashable {
    let id: String
    let name: String
    let surname: String
    let phone: String
    let email: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
