//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by egigoka on 04.10.2025.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
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
        Spacer()
            .frame(height: verticalSizeClass == .compact ? 0 : 60)
        Button(buttonText) {
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
        .overlay(Capsule().stroke(Color(.label), lineWidth: 3))
        .font(.title)
        .buttonSizing(.flexible)
        .buttonStyle(.borderedProminent)
        .padding()
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
