//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by egigoka on 04.10.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonText = "START"
    @State private var currentLight: CurrentLight = .none
    
    var body: some View {
        VStack {
            VStack {
                ColoredCircle(
                    color: .red, opacity: currentLight == .red ? 1 : 0.3)
                ColoredCircle(
                    color: .yellow, opacity: currentLight == .yellow ? 1 : 0.3)
                ColoredCircle(
                    color: .green, opacity: currentLight == .green ? 1 : 0.3)
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
        switch currentLight {
        case .none: currentLight = .red
        case .red: currentLight = .yellow
        case .yellow: currentLight = .green
        case .green: currentLight = .red
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
