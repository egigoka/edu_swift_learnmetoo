//
//  ContactDetails.swift
//  ContactsSwiftUI
//
//  Created by egigoka2kz on 31.08.2026.
//

import SwiftUI

struct ContactDetails: View {
    let contact: Person
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "phone")
                Text("\(contact.phone)")
                Spacer()
            }
            .padding()
            HStack {
                Image(systemName: "tray")
                Text(contact.email)
                Spacer()
            }
            .padding()
            Spacer()
        }
        .navigationTitle(contact.name)
    }
}

#Preview {
    ContactDetails(contact: Person.generateContact())
}
