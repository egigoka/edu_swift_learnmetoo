//
//  StylizedButton.swift
//  TrafficLightSwiftUI
//
//  Created by egigoka2kz on 21.07.2026.
//

import SwiftUI

struct StylizedButton: View {
    
    let buttonText: String
    let action: () -> Void
    
    var body: some View {
        Button(buttonText, action: action)
        .buttonStyle(.glassProminent)
        .font(.title)
        .padding()
    }
}

#Preview {
    StylizedButton(buttonText: "VIEW", action: {})
}
