//
//  FlightBoard.swift
//  FlightTimeline
//
//  Created by egigoka on 08.11.2025.
//

import SwiftUI

struct FlightBoard: View {
    @State private var hideCancelled = false
    
    let boardName: String
    let flightInfo: [FlightInformation]
    
    var shownFlights: [FlightInformation] {
        hideCancelled
            ? flightInfo.filter { $0.status != .cancelled }
            : flightInfo
    }
    
    var body: some View {
        
        List(shownFlights) { flight in
            FlightRow(flight: flight)
        }
        .navigationBarTitle(boardName)
        .navigationBarItems(
            trailing:
                Toggle("Hide cancelled", isOn: $hideCancelled)
        )
    }
}

#Preview {
    FlightBoard(
        boardName: "Arrivals",
        flightInfo: FlightInformation.generateFlights()
    )
}
