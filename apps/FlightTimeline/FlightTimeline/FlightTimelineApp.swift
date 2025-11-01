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
            //ContentView()
            TimelineInfo(flights: FlightInformation.generateFlights())
        }
    }
}

#Preview {
    FlightTimelineApp_Preview()
}

struct FlightTimelineApp_Preview: View {
    var body: some View {
        FlightTimelineApp.body
    }
}
