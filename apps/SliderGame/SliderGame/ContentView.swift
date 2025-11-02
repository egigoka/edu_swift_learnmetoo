//
//  ContentView.swift
//  SliderGame
//
//  Created by egigoka on 02.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue: Float
    @State private var targetValue: Int
    @State private var alertShown = false
    private var opacity: Float {
        Float(computeScore()) * 0.01
    }
    
    
    
    init() {
        currentValue = 0
        targetValue = Int.random(in: 0...100)
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Get as close to the value: \(targetValue)")
            UISliderView(currentValue: $currentValue, targetValue: targetValue, opacity: opacity)
                .frame(height: 16)
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
        let difference = abs(targetValue - lroundf(currentValue))
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
