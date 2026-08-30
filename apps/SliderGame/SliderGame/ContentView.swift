//
//  ContentView.swift
//  SliderGame
//
//  Created by egigoka2kz on 30.08.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State var targetValue = Int.random(in: 0...100)
    @State var sliderValue = 0.0
    
    var body: some View {
        VStack {
            Text("Move the slider as close as you can to \(targetValue)")
            GameSlider(
                value: $sliderValue,
                color: .red,
                alpha: CGFloat(computeScore()) / 100
            )
            Button("") {
                print("test")
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(sliderValue))
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
