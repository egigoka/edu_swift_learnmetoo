//
//  FlightBoard.swift
//  FlightTimeline
//
//  Created by egigoka on 08.11.2025.
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
