//
//  ContentView.swift
//  ContactsSwiftUI
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct ContentView: View {
    private let contacts = Person.generateContacts()
    
    var body: some View {
        NavigationView {
            TabView {
                NavigationStack {
                    PersonsList(contacts: contacts)
                }
                    .tabItem {
                        Image(systemName: "person.3")
                        Text("Contacts")
                    }
                NavigationStack {
                    DetailsList(contacts: contacts)
                }
                    .tabItem {
                        Image(systemName: "phone")
                        Text("Details")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
