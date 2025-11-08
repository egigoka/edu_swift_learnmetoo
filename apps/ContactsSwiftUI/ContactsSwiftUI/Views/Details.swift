//
//  DetailsList.swift
//  ContactsSwiftUI
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct Details: View {
    let contact: Person
    
    var body: some View {
        List {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                .frame(maxWidth: .infinity, alignment: .center)
            HStack {
                Image(systemName: "phone")
                    .foregroundColor(.blue)
                Text("\(contact.phone)")
            }
            HStack {
                Image(systemName: "tray")
                    .foregroundColor(.blue)
                Text("\(contact.email)")
            }
        }
        .navigationTitle(Text("\(contact.fullName)"))
    }
}

#Preview {
    Details(contact: Person.generateContact())
}
