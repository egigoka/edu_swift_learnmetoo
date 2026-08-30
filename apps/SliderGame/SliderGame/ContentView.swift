//
//  ContentView.swift
//  SliderGame
//
//  Created by egigoka2kz on 30.08.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State var targetValue = Int.random(in: 0...100)
    @State var sliderValue = Double.random(in: 0...100)
    @State var alertIsShown = false
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Move the slider as close as you can to \(targetValue)")
            GameSlider(
                value: $sliderValue,
                color: .red,
                alpha: CGFloat(computeScore()) / 100
            )
            Button("Check me!") {
                alertIsShown = true
            }
            .alert(
                "Your score is \(computeScore())",
                isPresented: $alertIsShown
            ) { }
            Button("Start over") {
                targetValue = Int.random(in: 0...100)
                sliderValue = Double.random(in: 0...100)
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
