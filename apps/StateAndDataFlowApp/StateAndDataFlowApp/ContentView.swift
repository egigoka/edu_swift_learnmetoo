//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka on 12.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    
    var body: some View {
        VStack {
            Text("\(tapCount)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Spacer()
            Button("Tap me") {
                tapCount += 1
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
