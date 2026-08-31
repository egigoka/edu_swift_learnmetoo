//
//  ContactsList.swift
//  ContactsSwiftUI
//
//  Created by egigoka2kz on 31.08.2026.
//

import SwiftUI

struct ContactsList: View {
    let contacts: [Contact]
    
    var body: some View {
        List {
            ForEach(contacts) { contact in
                NavigationLink(destination: ContactDetails(contact: contact)) {
                    Text(contact.name)
                }
            }
        }
    }
}

#Preview {
    ContactsList(contacts: Contact.generateContacts())
}
