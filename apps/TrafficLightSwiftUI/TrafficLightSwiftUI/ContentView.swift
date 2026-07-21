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
        Spacer()
            .frame(height: 16)
        ColoredCircle(color: .red, opacity: red)
        ColoredCircle(color: .yellow, opacity: yellow)
        ColoredCircle(color: .green, opacity: green)
        StylizedButton(buttonText: buttonText) { self.buttonTapped() }
            .padding()
    }
    
}

extension ContentView {
    
    private func buttonTapped() {
        
        let lightIsOn = 1.0
        let lightIsOff = 0.3
        
        switch currentLight {
        case .red:
            red = lightIsOff
            yellow = lightIsOn
            currentLight = .yellow
        case .yellow:
            yellow = lightIsOff
            green = lightIsOn
            currentLight = .green
        case .green:
            green = lightIsOff
            red = lightIsOn
            currentLight = .red
        case .none:
            red = lightIsOn
            currentLight = .red
            buttonText = "NEXT"
        }
    }
}

#Preview {
    ContentView()
}

#Preview(traits: .landscapeLeft) {
    ContentView()
}

enum CurrentLight {
    case none
    case red
    case yellow
    case green
}
