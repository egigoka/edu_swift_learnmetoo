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
//        Color(color)
//            //.frame(width: 100, height: 100)
//            .scaledToFit()
//            .clipShape(Circle())
//            .opacity(opacity)
//            .overlay(Circle().stroke(Color(.label), lineWidth: 4))
        Circle()
            .foregroundStyle(color)
            .scaledToFit()
            .opacity(opacity)
            .overlay(Circle().stroke(Color(.label),
                                    lineWidth: 4))
    }
}

#Preview {
    ColoredCircle(color: .red, opacity: 0.5)
}
