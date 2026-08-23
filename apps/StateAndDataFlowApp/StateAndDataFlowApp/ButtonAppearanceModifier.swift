//
//  ButtonAppearanceModifier.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 23.08.2026.
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
                    .stroke(.foreground, lineWidth: 4)
            )
        
    }
}

extension Button {
    func buttonAppearance(color: Color) -> some View {
        modifier(ButtonAppearanceModifier(color: color))
    }
}

#Preview {
    Button(action: {}, label: { Text("Button") })
        .buttonAppearance(color: .red)
}
