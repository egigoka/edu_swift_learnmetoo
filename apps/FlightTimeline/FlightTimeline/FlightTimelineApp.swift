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
        //ContentView()
        TimelineInfo(flights: FlightInformation.generateFlights())
    }
}

#Preview {
    RootV
}
