//
//  PersonsList.swift
//  ContactsSwiftUI
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct PersonsList: View {
    let contacts: [Person]
    
    var body: some View {
        List(contacts) { person in
            NavigationLink(
                "\(person.fullName)",
                destination: Details(contact: person)
            )
        }
        .navigationTitle("Contact List")
    }
}

#Preview {
    PersonsList(contacts: Person.generateContacts())
}
