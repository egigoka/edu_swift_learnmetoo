//
//  DetailsList.swift
//  ContactsSwiftUI
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct ContactsDetailsList: View {
    let contacts: [Person]
    
    var body: some View {
        NavigationView {
            List(contacts) { person in
                Section(person.fullName) {
                    DetailsRow(
                        imageName: "phone",
                        details: person.phone,
                        person: person)
                    DetailsRow(
                        imageName: "tray",
                        details: person.email,
                        person: person)
                }
                .textCase(.none)
            }
            .navigationTitle("Details List")
        }
    }
}

#Preview {
    ContactsDetailsList(contacts: Person.generateContacts())
}
