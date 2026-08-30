//
//  HomeScreen.swift
//  FlightTimeline
//
//  Created by egigoka2kz on 30.08.2026.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        Image(systemName: "airplane")
            .resizable()
            .frame(width: 250, height: 250)
            .opacity(0.1)
            .rotationEffect(.degrees(-90))
    }
}

#Preview {
    HomeScreen()
}
