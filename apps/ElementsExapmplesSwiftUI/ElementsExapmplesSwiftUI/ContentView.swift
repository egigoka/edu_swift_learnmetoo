//
//  ContentView.swift
//  ElementsExapmplesSwiftUI
//
//  Created by egigoka on 05.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Double.random(in: 0...1)
    
    var body: some View {
        
        VStack {
            VStack {
                Text("\(sliderValue)")
                    .font(.largeTitle)
                
                .padding(.horizontal)
                ColorSlider(value: $sliderValue, textColor: .red)
                ColorSlider(value: $sliderValue, textColor: .green)
                ColorSlider(value: $sliderValue, textColor: .blue)
                Spacer()
            }
            
        }
        .padding()
        
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(textColor)
            Slider(value: $value)
            Text("255")
                .foregroundColor(textColor)
        }
    }
}

#Preview {
    ContentView()
}

