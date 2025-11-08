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
                    value: DetailsList(person: person)
                )
            }
        }
    }
}

#Preview {
    PersonsList(persons: DataManager.shared.generateContacts())
}
