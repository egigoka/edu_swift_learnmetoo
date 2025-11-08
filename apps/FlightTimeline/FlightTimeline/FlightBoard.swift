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
//            ScrollView([.vertical, .horizontal]) {
//                ForEach(flightInfo) { flight in
//                    Text("\(flight.airline) \(flight.number)")
//                    Text("\(flight.flightStatus) ")
//                }
//            }
        List(flightInfo) { flight in
            FlightRow(flight: flight)
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
