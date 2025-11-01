//
//  ContentView.swift
//  SliderGame
//
//  Created by egigoka on 02.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue: Float
    private var opacity: Float
    
    private var targetValue: Int
    
    
    init() {
        currentValue = 0
        opacity = 0
        targetValue = Int.random(in: 0...100)
        opacity =
    }
    
    var body: some View {
        VStack {
            Text("Get as close to the value: \(targetValue)")
            UISliderView(currentValue: $currentValue, targetValue: targetValue, opacity: opacity)
            Button("Check me!") {
                
            }
            Button("Restart") {
                
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - round(currentValue))
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
