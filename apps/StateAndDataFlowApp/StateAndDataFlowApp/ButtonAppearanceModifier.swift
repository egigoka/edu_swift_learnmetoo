//
//  ButtonAppearanceModifier.swift
//  StateAndDataFlowApp
//
//  Created by egigoka on 26.10.2025.
//

import SwiftUI

struct ButtonAppearanceModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 60)
            .background(color)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 4)
            )
    }
}

extension View {
    func buttonAppearance(_ color: Color) -> some View {
        modifier(ButtonAppearanceModifier(color: color))
    }
}
