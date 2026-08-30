//
//  ContentView.swift
//  FlightTimeline
//
//  Created by egigoka2kz on 27.08.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Home")
                }
            UserProfile()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Home")
                }
        }
    }
}

#Preview {
    ContentView()
}
