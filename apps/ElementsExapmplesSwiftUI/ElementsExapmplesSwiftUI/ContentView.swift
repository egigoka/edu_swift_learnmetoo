//
//  ContentView.swift
//  ElementsExapmplesSwiftUI
//
//  Created by egigoka on 05.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Double(Int.random(in: 0...255))
    
    //debug
    @State private var speed = 50.0
    @State private var isEditing = false
    //debug END
    
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
                
                //debug
                Slider(
                    value: $speed,
                    in: 0...100,
                    step: 5
                ){
                    
                            Text("Speed")
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("100")
                        
                } onEditingChanged: { editing in
                    isEditing = editing
                }
                Text("\(speed)")
                    .foregroundColor(isEditing ? .red : .blue)
                //debug END
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
            Slider(value: $value, in: 0...255, step: 1) {}
            Text("255")
                .foregroundColor(textColor)
        }
    }
}

#Preview {
    ContentView()
}
