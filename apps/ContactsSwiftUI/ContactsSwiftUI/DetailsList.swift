//
//  DetailsList.swift
//  ContactsSwiftUI
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct DetailsList: View {
    let contacts: [Person]
    
    var body: some View {
        List(contacts) { person in
            Section(person.fullName) {
                DetailInfo(imageName: "phone", details: person.phone, person: person)
                DetailInfo(imageName: "tray", details: person.email, person: person)
            }
        }
        .navigationTitle("Details List")
    }
}

struct DetailInfo: View {
    let imageName: String
    let details: String
    let person: Person
    var body: some View {
        NavigationLink(destination: Details(contact: person)) {
            Image(systemName: imageName)
            Text(details)
        }
    }
}

#Preview {
    DetailsList(contacts: Person.generateContacts())
}
