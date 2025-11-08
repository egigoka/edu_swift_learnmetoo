//
//  ContentView.swift
//  SliderGame
//
//  Created by egigoka on 02.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue: Int = Int.random(in: 1...100)
    @State private var currentValue: Double = 50
    @State private var alertShown = false
    
    var body: some View {
        VStack(spacing: 24) {
            GameSlider(currentValue: $currentValue,
                       targetValue: targetValue,
                       color: .red,
                       alpha: computeScore())
            Button("Check me!") {
                alertShown = true
            }
            Button("Restart") {
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
        .alert(isPresented: $alertShown) {
            let message = Text("\(computeScore())")
                .bold()
            return Alert(title: Text("Your score"), message: message)
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
