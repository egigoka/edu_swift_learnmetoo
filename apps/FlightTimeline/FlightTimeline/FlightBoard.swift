//
//  FlightBoard.swift
//  FlightTimeline
//
//  Created by egigoka on 08.11.2025.
//

import SwiftUI

struct FlightBoard: View {
    let boardName: String
    let flightInfo: [FlightInformation]
    
    var body: some View {
        VStack {
            Text(boardName)
                .font(.title)
            ScrollView {
                ForEach(flightInfo) { flight in
                    Text("\(flight.airline) \(flight.number)")
                    Text("\(flight.flightStatus) ")
                }
            }
        }
    }
}

#Preview {
    FlightBoard(
        boardName: "Arrivals",
        flightInfo: FlightInformation.generateFlights()
    )
}
