//
//  ContentView.swift
//  ElementsExapmplesSwiftUI
//
//  Created by egigoka on 05.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Double(Int.random(in: 0...255))
    @State private var userName = ""
    
    var body: some View {
        
        VStack {
            Text("\(lround(sliderValue))")
                .font(.largeTitle)
                .padding(.horizontal)
            UserNameView(userName: userName)
            ColorSlider(value: $sliderValue, textColor: .red)
            TextField("Enter your name", text: $userName)
                .textFieldStyle(.roundedBorder)
            ColorSlider(value: $sliderValue, textColor: .green)
            ColorSlider(value: $sliderValue, textColor: .blue)
            Spacer()
        }
        .padding()
        
    }
}

struct UserNameView: View {
    let userName: String
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text("USERNAME:")
            Text(userName)
                .font(.largeTitle)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(textColor)
            Slider(value: $value, in: 0...255, step: 1) {} // empty closure to use different init of Slider to workaround bug that doesn't apply step argument
            Text("255")
                .foregroundColor(textColor)
        }
    }
}

#Preview {
    ContentView()
}
