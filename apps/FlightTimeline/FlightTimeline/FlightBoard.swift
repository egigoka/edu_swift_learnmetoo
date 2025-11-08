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
        List(flightInfo) { flight in
            NavigationLink(
                destination: FlightBoardInformation(flight: flight)
            ) {
                FlightRow(flight: flight)
            }
        }
        .navigationBarTitle(Text(boardName))
    }
}

#Preview {
    FlightBoard(
        boardName: "Arrivals",
        flightInfo: FlightInformation.generateFlights()
    )
}
