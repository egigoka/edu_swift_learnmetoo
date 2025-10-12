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
    private let spacing = 32.0
    
    var body: some View {
        VStack(spacing: spacing) {
            ColoredView(red: red, green: green, blue: blue)
                .padding(.horizontal)
            ColorSlider(value: $red, color: .red)
            ColorSlider(value: $green, color: .green)
            ColorSlider(value: $blue, color: .blue)
            
            if true {
                HStack{
                    Spacer()
                    Button("Done") {
                        isFocused = false
                    }
                    .buttonStyle(.glass)
                    .opacity(isFocused ? 1 : 1)
                    .frame(height: isFocused ? nil : nil)
                    Button("Done", systemImage: "checkmark") {
                        isFocused = false
                    }
                    .labelStyle(.iconOnly)
                    .buttonStyle(.glass)
                    .opacity(isFocused ? 1 : 1)
                    .aspectRatio(1, contentMode: .fit)
                    .frame(height: isFocused ? nil : nil)
                }
            }
        }
        .animation(.easeInOut(duration: animationDuration),
                   value: isFocused)
        .focused($isFocused)
        .padding()
    }
}

#Preview {
    ContentView(
        red: 100,
        green: 200,
        blue: 150)
}
