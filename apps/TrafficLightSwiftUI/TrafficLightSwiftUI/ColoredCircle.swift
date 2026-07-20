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
            .fill(color)
            .opacity(opacity)
            .overlay(Circle().stroke(.foreground, lineWidth: 4))
    }
}

#Preview {
    ColoredCircle(color: .red, opacity: 1)
}
