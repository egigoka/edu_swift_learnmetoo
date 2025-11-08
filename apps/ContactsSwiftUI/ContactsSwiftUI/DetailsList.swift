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
        NavigationLink(destination: Details(person: person)) {
            Image(systemName: imageName)
            Text(details)
        }
    }
}

#Preview {
    DetailsList(persons: DataManager.shared.generateContacts())
}
