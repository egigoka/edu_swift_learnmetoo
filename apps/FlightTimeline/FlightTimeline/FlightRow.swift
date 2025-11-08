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
                .frame(width: 120, alignment: .leading)
            Text("\(flight.otherAirport)")
                .frame(alignment: .leading)
            Spacer()
            Text("\(flight.flightStatus)")
                .frame(alignment: .trailing)
        }
    }
}

#Preview {
    FlightRow(flight: FlightInformation.generateFlight())
}
