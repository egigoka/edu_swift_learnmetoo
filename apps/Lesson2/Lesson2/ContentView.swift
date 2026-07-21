//
//  ContentView.swift
//  Lesson2
//
//  Created by egigoka2kz on 21.07.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Double.random(in: 0...255)
    @State private var userName = ""
    
    var body: some View {
        VStack {
            Text("\(lround(sliderValue))")
                .font(.largeTitle)
            UserNameText(userName: $userName)
            ColoredSlider(value: $sliderValue, textColor: .red)
            Slider(value: $sliderValue, in: 0...255)
            TextField("Enter your name", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
