//
//  ContactsDetails.swift
//  ContactsSwiftUI
//
//  Created by egigoka2kz on 31.08.2026.
//

import SwiftUI

struct ContactsDetails: View {
    let contacts: [Person]
    
    var body: some View {
        List {
            ForEach (contacts) { contact in
                Section(header: Text(contact.name)) {
                    HStack {
                        Image(systemName: "phone")
                        Text(contact.phone)
                    }
                    HStack {
                        Image(systemName: "tray")
                        Text(contact.email)
                    }
                }
            }
        }
    }
}

#Preview {
    ContactsDetails(contacts: Person.generateContacts())
}
