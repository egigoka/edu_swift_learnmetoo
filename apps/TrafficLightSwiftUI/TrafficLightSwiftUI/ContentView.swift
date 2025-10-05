//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by egigoka on 04.10.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentLight: CurrentLight = .none
    
    @State var redOpacity = 0.3
    @State var yellowOpacity = 0.3
    @State var greenOpacity = 0.3
    
    @State var buttonText = "START"
    
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
    
    private func buttonTapped() {
        switch currentLight {
        case .none:
            redOpacity = 1
            currentLight = .red
        case .red:
            redOpacity = 0.3
            yellowOpacity = 1
            currentLight = .yellow
        case .yellow:
            yellowOpacity = 0.3
            greenOpacity = 1
            currentLight = .green
        case .green:
            greenOpacity = 0.3
            redOpacity = 1
            currentLight = .red
        }
        buttonText = "NEXT"
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
