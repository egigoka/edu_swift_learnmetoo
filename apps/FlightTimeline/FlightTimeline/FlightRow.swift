//
//  FlightRow.swift
//  FlightTimeline
//
//  Created by egigoka on 08.11.2025.
//

import SwiftUI

struct FlightRow: View {
    @State private var isPresented = false
    
    let flight: FlightInformation
    
    var body: some View {
        Button(action: { isPresented.toggle() } ) {
            HStack {
                Text("\(flight.airline) \(flight.number)")
                    .frame(width: 120, alignment: .leading)
                Text("\(flight.otherAirport)")
                    .frame(alignment: .leading)
                Spacer()
                Text("\(flight.flightStatus)")
                    .frame(alignment: .trailing)
            }
            .sheet(isPresented: $isPresented) {
                FlightBoardInformation(flight: flight)
            }
        }
    }
}

#Preview {
    FlightRow(flight: FlightInformation.generateFlight())
}
