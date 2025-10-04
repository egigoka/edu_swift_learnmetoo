//
//  ColoredCircle.swift
//  TrafficLightSwiftUI
//
//  Created by egigoka on 04.10.2025.
//

import SwiftUI

struct ColoredCircle: View {
    
    let color: Color
    
    var body: some View {
        Color(color)
            //.frame(width: 100, height: 100)
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(.label), lineWidth: 4))
    }
}

#Preview {
    ColoredCircle(color: .red)
}
