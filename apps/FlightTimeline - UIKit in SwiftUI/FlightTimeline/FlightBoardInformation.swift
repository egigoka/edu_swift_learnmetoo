//
//  FlightBoardInformation.swift
//  FlightTimeline
//
//  Created by egigoka2kz on 31.08.2026.
//

import SwiftUI

struct FlightBoardInformation: View {
    @Binding var isPresented: Bool
    
    let flight: FlightInformation
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(flight.airline) Flight \(flight.number)")
                    .font(.title)
                Spacer()
                Button("Done") {
                    isPresented = false
                }
            }
            Text("\(flight.direction == .arrival ? "From" : "To") \(flight.otherAirport)")
            Text("\(flight.flightStatus)")
                .foregroundStyle(Color(flight.timelineColor))
            Spacer()
            
        }
        .font(.headline)
        .padding()
        //.navigationTitle("Flight Information")
    }
}

#Preview {
    FlightBoardInformation(isPresented: .constant(true), flight: FlightInformation.generateFlight())
}
