//
//  StylizedButton.swift
//  TrafficLightSwiftUI
//
//  Created by egigoka on 05.10.2025.
//

import SwiftUI

struct StylizedButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
        }
        .buttonStyle(.borderedProminent)
        .overlay(Capsule().stroke(Color(.label), lineWidth: 4))
        .buttonSizing(.flexible)
        .padding()
    }
}

#Preview {
    StylizedButton(title: "Preview") { }
}
