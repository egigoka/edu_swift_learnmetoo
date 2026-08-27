//
//  ContentView.swift
//  FlightTimeline
//
//  Created by egigoka2kz on 27.08.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Flight Timeline")
        TimelineInfo(flights: FlightInformation.generateFlights())
    }
}

#Preview {
    ContentView()
}
