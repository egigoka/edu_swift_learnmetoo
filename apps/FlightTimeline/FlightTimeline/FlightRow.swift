//
//  FlightRow.swift
//  FlightTimeline
//
//  Created by egigoka on 08.11.2025.
//

import SwiftUI

struct FlightRow: View {
    let flight: FlightInformation
    
    var body: some View {
        HStack {
            Text("\(flight.airline) \(flight.number)")
            Text("\(flight.otherAirport)")
            Text("\(flight.flightStatus)")
        }
    }
}

#Preview {
    FlightRow(flight: FlightInformation.generateFlight())
}
