//
//  ContentView.swift
//  Lesson2
//
//  Created by egigoka2kz on 21.07.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue = Double.random(in: 0...1)
    
    var body: some View {
        VStack {
            Text("\(sliderValue)")
                .font(.largeTitle)
            ColoredSlider(value: $sliderValue, color: .red)
            
            Slider(value: $sliderValue)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
