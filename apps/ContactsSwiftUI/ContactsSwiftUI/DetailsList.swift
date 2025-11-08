//
//  DetailsList.swift
//  ContactsSwiftUI
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct DetailsList: View {
    let person: Person
    
    var body: some View {
        List {
            Image(systemName: "person.fill")
                .resizable()
                .frame(height: 250)
            Text("\(person.phone)")
            Text("\(person.email)")
        }
    }
}

#Preview {
    DetailsList(person: DataManager.shared.generateContact())
}
