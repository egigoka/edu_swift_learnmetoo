//
//  StylizedButton.swift
//  TrafficLightSwiftUI
//
//  Created by egigoka on 05.10.2025.
//

import SwiftUI

struct StylizedButton: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .buttonStyle(.borderedProminent)
//            .overlay(Capsule().stroke(Color(.label), lineWidth: 3))
//            .font(.title)
//            .buttonSizing(.flexible)
//            .padding()
        Button(configuration)
            .buttonStyle(.borderedProminent)
            .overlay(Capsule().stroke(Color(.label), lineWidth: 3))
            .font(.title)
            .buttonSizing(.flexible)
            .padding()
    }
}

#Preview {
    Button("Preview") { }
        .buttonStyle(StylizedButton())
}
