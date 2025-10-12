//
//  ContentView.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 11.10.2025.
//

import SwiftUI

struct ContentView: View {
    @FocusState var isFocused: Bool
    
    @State var red: Double
    @State var green: Double
    @State var blue: Double
    
    private let animationDuration = 0.25
    
    var body: some View {
        VStack {
            VStack(spacing: 32) {
                ColoredView(red: red, green: green, blue: blue)
                    .padding(.horizontal)
                ColorSlider(sliderValue: $red, color: .red)
                ColorSlider(sliderValue: $green, color: .green)
                ColorSlider(sliderValue: $blue, color: .blue)
            }
            HStack(spacing: 0){
                Spacer()
                DoneButtonLarge(isFocused: _isFocused)
            }
            .frame(height: isFocused ? nil : 0)
            .padding(isFocused ? .top : .leading)
        }
        .animation(.easeInOut(duration: animationDuration),
                   value: isFocused)
        .focused($isFocused)
        .padding()
        .onTapGesture {
            isFocused = false
        }
    }
}

#Preview {
    ContentView(
        red: 100,
        green: 200,
        blue: 150)
}
