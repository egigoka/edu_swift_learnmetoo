//
//  FlightTimelineApp.swift
//  FlightTimeline
//
//  Created by egigoka on 27.10.2025.
//

import SwiftUI

@main
struct FlightTimelineApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    var body: some View {
        ContentView()
        //TimelineInfo(flights: FlightInformation.generateFlights())
    }
}

#Preview("Light Mode") {
    RootView()
        .environment(\.colorScheme, .light)
}

#Preview("Dark Mode") {
    ZStack {
        Color.black
            .ignoresSafeArea()
        RootView()
            .environment(\.colorScheme, .dark)
    }
}
