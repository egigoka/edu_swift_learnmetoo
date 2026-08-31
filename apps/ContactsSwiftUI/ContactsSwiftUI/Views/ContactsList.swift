//
//  ContactsList.swift
//  ContactsSwiftUI
//
//  Created by egigoka2kz on 31.08.2026.
//

import SwiftUI

struct ContactsList: View {
    let contacts: [Person]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts) { contact in
                    NavigationLink(destination: ContactDetails(contact: contact)) {
                        Text(contact.name)
                    }
                }
            }
            .navigationTitle("Contacts")
        }
    }
}

#Preview {
    ContactsList(contacts: Person.generateContacts())
}
