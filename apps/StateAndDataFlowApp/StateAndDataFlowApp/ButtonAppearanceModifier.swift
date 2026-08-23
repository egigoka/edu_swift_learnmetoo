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

struct ButtonTextAppearanceModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.title)
            .fontWeight(.bold)
    }
}

extension Text {
    func buttonAppearance() -> some View {
        modifier(ButtonTextAppearanceModifier())
    }
}

#Preview {
    Button {
        
    } label: {
        Text("Button")
            .buttonAppearance()
    }
        .buttonAppearance(color: .red)
}
