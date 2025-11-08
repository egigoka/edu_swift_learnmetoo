//
//  HomeScreen.swift
//  FlightTimeline
//
//  Created by egigoka on 08.11.2025.
//

import SwiftUI

struct HomeScreen: View {
    let flightInfo = FlightInformation.generateFlights()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .opacity(0.1)
                    .rotationEffect(.degrees(-90))
                VStack(alignment: .leading, spacing: 10) {
                    NavigationLink(
                        "Arrivals",
                        destination: FlightBoard(boardName: "Arrivals")
                    )
                    NavigationLink(
                        "Departures",
                        destination: FlightBoard(boardName: "Departures")
                    )
                    NavigationLink(
                        "Flight Timeline",
                        destination: TimelineInfo(flights: flightInfo)
                    )
                    
                    Spacer()
                }
                .font(.title)
            }
        }
        .navigationBarTitle(Text("Airport"))
    }
}

#Preview {
    HomeScreen()
}
