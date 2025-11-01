//
//  ContentView.swift
//  SliderGame
//
//  Created by egigoka on 02.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue: Float
    @State private var alertShown = false
    private var opacity: Float {
        Float(computeScore()) * 0.01
    }
    private var targetValue: Int
    
    
    
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
                
            }
        }
        .padding()
        .alert(isPresented: $alertShown) {
            Alert(title: Text("title"),
                  message: Text("message \(computeScore())"))
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
