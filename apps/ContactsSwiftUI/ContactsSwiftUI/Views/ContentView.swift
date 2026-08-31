//
//  ContentView.swift
//  ContactsSwiftUI
//
//  Created by egigoka2kz on 31.08.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var contacts = Contact.generateContacts()
    
    var body: some View {
        TabView {
            ContactsList(contacts: contacts)
                .tabItem {
                    Label("List", systemImage: "list.dash")
                }
            ContactsDetails(contacts: contacts)
                .tabItem {
                    Label("Map", systemImage: "phone")
                }
        }
    }
}

#Preview {
    ContentView()
}
