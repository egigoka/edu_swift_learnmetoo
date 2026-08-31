//
//  HomeScreen.swift
//  FlightTimeline
//
//  Created by egigoka2kz on 30.08.2026.
//

import SwiftUI

struct HomeScreen: View {
    
    let flightsInfo = FlightInformation.generateFlights()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .opacity(0.1)
                    .rotationEffect(.degrees(-90))
                
                VStack(alignment: .leading, spacing: 16) {
                    NavigationLink("Arrivals") {
                        FlightBoard(
                            boardName: "Arrivalls",
                            flightsInfo: flightsInfo.filter
                                { $0.direction == .arrival }
                        )
                    }
                    NavigationLink("Departures") {
                        FlightBoard(
                            boardName: "Departures",
                            flightsInfo: flightsInfo.filter
                                { $0.direction == .departure }
                        )
                    }
                    NavigationLink("Flight Timeline") {
                        TimelineInfo(flights: flightsInfo)
                    }
                    
                    Spacer()
                }
                .font(.title)
            }
            .navigationTitle("Airport")
        }
    }
}

#Preview {
    HomeScreen()
}
