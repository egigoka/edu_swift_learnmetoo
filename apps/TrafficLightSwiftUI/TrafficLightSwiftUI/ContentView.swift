//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by egigoka on 04.10.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentLight: CurrentLight = .none
    @State private var red: CGFloat = 0.3
    @State private var yellow: CGFloat = 0.3
    @State private var green: CGFloat = 0.3
    @State private var buttonText: String = "START"
    
    var body: some View {
        ColoredCircle(color: .red, opacity: red)
        ColoredCircle(color: .yellow, opacity: yellow)
        ColoredCircle(color: .green, opacity: green)
        StylizedButton(buttonText: buttonText) { self.buttonTapped() }
            .padding()
    }
    
}

extension ContentView {
    
    private func buttonTapped() {
        switch currentLight {
        case .red:
            red = 0.3
            yellow = 1
            currentLight = .yellow
        case .yellow:
            yellow = 0.3
            green = 1
            currentLight = .green
        case .green:
            green = 0.3
            red = 1
            currentLight = .red
        case .none:
            red = 1
            currentLight = .red
            buttonText = "NEXT"
        }
    }
}

#Preview {
    ContentView()
}

enum CurrentLight {
    case none
    case red
    case yellow
    case green
}
