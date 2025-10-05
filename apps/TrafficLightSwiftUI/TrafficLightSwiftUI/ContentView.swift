//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by egigoka on 04.10.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonText = "START"
    
    @State private var redOpacity = 0.3
    @State private var yellowOpacity = 0.3
    @State private var greenOpacity = 0.3
    
    @State private var currentLight: CurrentLight = .green
    
    var body: some View {
        VStack {
            VStack {
                ColoredCircle(
                    color: .red, opacity: redOpacity)
                ColoredCircle(
                    color: .yellow, opacity: yellowOpacity)
                ColoredCircle(
                    color: .green, opacity: greenOpacity)
            }
        }
        .padding(.top)
        ResponsiveSpacer(portraitHeight: 60, landscapeHeight: 0)
        StylizedButton(title: buttonText) {
            buttonTapped()
        }
    }
    
}

extension ContentView {
    
    private func buttonTapped() {
        let lightOn = 1.0
        let lightOff = 0.3
        
        switch currentLight {
        case .red:
            redOpacity = lightOff
            yellowOpacity = lightOn
            currentLight = .yellow
        case .yellow:
            yellowOpacity = lightOff
            greenOpacity = lightOn
            currentLight = .green
        case .green:
            greenOpacity = lightOff
            redOpacity = lightOn
            currentLight = .red
        }
        buttonText = "NEXT"
    }
}

#Preview {
    ContentView()
}

enum CurrentLight {
    case red
    case yellow
    case green
}
