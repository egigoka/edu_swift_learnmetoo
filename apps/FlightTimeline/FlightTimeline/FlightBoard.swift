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
        Text(boardName)
            .font(.title)
        
    }
}

#Preview {
    FlightBoard(
        boardName: "Arrivals",
        flightInfo: FlightInformation.generateFlights()
    )
}
