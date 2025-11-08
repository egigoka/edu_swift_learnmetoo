//
//  ContentView.swift
//  ContactsSwiftUI
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct ContentView: View {
    let persons = DataManager.shared.generateContacts()
    
    var body: some View {
        TabView {
            PersonsList(persons: persons)
            PersonsList(persons: persons)
        }
    }
}

#Preview {
    ContentView()
}
