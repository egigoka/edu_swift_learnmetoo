//
//  SwiftUIView.swift
//  ContactsSwiftUI
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct DetailsRow: View {
    let imageName: String
    let details: String
    let person: Person
    var body: some View {
        NavigationLink(destination: Details(contact: person)) {
            Image(systemName: imageName)
            Text(details)
        }
    }
}

#Preview {
    DetailsRow(imageName: "cross", details: "preview", person: Person.generateContact())
}
