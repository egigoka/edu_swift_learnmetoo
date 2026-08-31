//
//  ContentView.swift
//  ContactsSwiftUI
//
//  Created by egigoka2kz on 31.08.2026.
//

import SwiftUI

struct ContentView: View {
    private let contacts = Person.generateContacts()
    
    var body: some View {
        TabView {
            ContactsList(contacts: contacts)
                .tabItem {
                    Label("List", systemImage: "list.dash")
                }
            ContactsDetails(contacts: contacts)
                .tabItem {
                    Label("Details", systemImage: "phone")
                }
        }
    }
}

#Preview {
    ContentView()
}
