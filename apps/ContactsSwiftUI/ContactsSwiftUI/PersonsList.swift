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
        ForEach(persons) { person in
            Text("\(person.name) \(person.surname)")
        }
    }
}

#Preview {
    PersonsList(persons: DataManager.shared.generateContacts())
}
