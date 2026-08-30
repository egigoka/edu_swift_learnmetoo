//
//  FlightBoard.swift
//  FlightTimeline
//
//  Created by egigoka2kz on 30.08.2026.
//

import SwiftUI

struct FlightBoard: View {
    let boardName: String
    var body: some View {
        Text(boardName)
            .font(.title)
        
    }
}

#Preview {
    FlightBoard(boardName: "Arrivals")
}
