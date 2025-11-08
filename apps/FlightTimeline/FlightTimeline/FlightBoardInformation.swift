//
//  FlightBoardInformation.swift
//  FlightTimeline
//
//  Created by egigoka on 08.11.2025.
//

import SwiftUI

struct FlightBoardInformation: View {
    @Binding var isPresented: Bool
    
    let flight: FlightInformation
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(flight.airline) Flight \(flight.number)")
                    .font(.largeTitle)
                Spacer()
                Button("Done") { isPresented = false }
            }
            Text("\(flight.direction == .arrival ? "From" : "To") \(flight.otherAirport)")
            Text("\(flight.flightStatus)")
                .foregroundColor(Color(flight.timelineColor))
            Spacer()
        }
        .font(.headline)
        .padding()
//        .navigationBarTitle("Flight Information")
//        .navigationBarItems(trailing:
//                                Button("Done") { isPresented = false }
//        )
    }
}

#Preview {
    FlightBoardInformation(
        isPresented: .constant(false),
        flight: FlightInformation.generateFlight())
}
