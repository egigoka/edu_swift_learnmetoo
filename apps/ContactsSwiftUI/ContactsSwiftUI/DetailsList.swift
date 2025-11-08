//
//  DetailsList.swift
//  ContactsSwiftUI
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct DetailsList: View {
    let persons: [Person]
    
    var body: some View {
        List(persons) { person in
            NavigationLink(destination: Details(person: person)) {
                Section(person.fullName) {
                    DetailInfo(imageName: "phone", details: person.phone)
                    DetailInfo(imageName: "tray", details: person.email)
                }
            }
        }
        .navigationTitle("Details List")
    }
}

struct DetailInfo: View {
    let imageName: String
    let details: String
    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(details)
        }
    }
}

#Preview {
    DetailsList(persons: DataManager.shared.generateContacts())
}
