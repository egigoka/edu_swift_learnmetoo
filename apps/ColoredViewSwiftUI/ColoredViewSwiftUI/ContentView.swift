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
            
            HStack{
                Spacer()
                Button("Done") {
                    isFocused = false
                }
                .buttonStyle(.glassProminent)
                .opacity(isFocused ? 1 : 0)
                .frame(height: isFocused ? nil : 0)
                .padding(isFocused ? .bottom : .horizontal)
            }
        }
        .animation(.easeInOut(duration: animationDuration),
                   value: isFocused)
        .focused($isFocused)
        .padding(.horizontal)
        .padding(.top)
    }
}

#Preview {
    ContentView(
        red: 100,
        green: 200,
        blue: 150)
}
