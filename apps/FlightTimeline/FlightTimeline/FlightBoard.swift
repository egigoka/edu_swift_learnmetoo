//
//  FlightBoard.swift
//  FlightTimeline
//
//  Created by egigoka2kz on 30.08.2026.
//

import SwiftUI

struct FlightBoard: View {
    let boardName: String
    let flightsInfo: [FlightInformation]
    
    var body: some View {
        List(flightsInfo) { flight in
            FlightRow(flight: flight)
        }
        .navigationTitle(boardName)
    }
}

#Preview {
    FlightBoard(
        boardName: "Arrivals",
        flightsInfo: FlightInformation.generateFlights()
    )
}
