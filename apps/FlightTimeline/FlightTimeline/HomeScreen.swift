//
//  HomeScreen.swift
//  FlightTimeline
//
//  Created by egigoka on 08.11.2025.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .opacity(0.1)
                    .rotationEffect(.degrees(-90))
                VStack {
                    NavigationLink(
                        "Arrivals",
                        destination: FlightBoard(boardName: "Arrivals")
                    )
                    NavigationLink(
                        "Departures",
                        destination: FlightBoard(boardName: "Departures")
                    )
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
}
