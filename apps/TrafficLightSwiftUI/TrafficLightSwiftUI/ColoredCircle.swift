//
//  ColoredCircle.swift
//  TrafficLightSwiftUI
//
//  Created by egigoka on 04.10.2025.
//

import SwiftUI

struct ColoredCircle: View {
    
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .foregroundStyle(color)
            .opacity(opacity)
            .overlay(
                Circle()
                    .stroke(.foreground, lineWidth: 4)
                    .opacity(0.5)
            )
    }
}

#Preview {
    ColoredCircle(color: .red, opacity: 1)
}
