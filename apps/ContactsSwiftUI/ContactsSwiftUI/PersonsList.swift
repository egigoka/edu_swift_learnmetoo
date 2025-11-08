//
//  PersonsList.swift
//  ContactsSwiftUI
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct PersonsList: View {
    let persons: [Person]
    
    var body: some View {
        NavigationView {
            List(persons) { person in
                NavigationLink(
                    "\(person.fullName)",
                    destination: Details(person: person)
                )
            }
            .navigationTitle("Contact List")
        }
    }
}

#Preview {
    PersonsList(persons: DataManager.shared.generateContacts())
}
