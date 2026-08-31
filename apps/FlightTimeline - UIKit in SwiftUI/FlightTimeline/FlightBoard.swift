//
//  FlightBoard.swift
//  FlightTimeline
//
//  Created by egigoka2kz on 30.08.2026.
//

import SwiftUI

struct FlightBoard: View {
    @State private var hideCancelled = false
    
    let boardName: String
    let flightsInfo: [FlightInformation]
    
    var shownFlights: [FlightInformation] {
        hideCancelled
            ? flightsInfo.filter { $0.status != .cancelled}
            : flightsInfo
    }
    
    var body: some View {
        
        List(shownFlights) { flight in
            //NavigationLink(destination: FlightBoardInformation(flight: flight)) {
                FlightRow(flight: flight)
            //}
        }
        .navigationTitle(boardName)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Toggle("Hide Cancelled", isOn: $hideCancelled)
                    //.toggleStyle(.switch)
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
