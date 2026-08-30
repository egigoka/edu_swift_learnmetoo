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
        Text(boardName)
            .font(.title)
        ScrollView {
            ForEach(flightsInfo) { flight in
                Text("\(flight.airline) \(flight.number)")
                Text("\(flight.status)")
            }
        }
    }
}

#Preview {
    FlightBoard(
        boardName: "Arrivals",
        flightsInfo: FlightInformation.generateFlights()
    )
}
