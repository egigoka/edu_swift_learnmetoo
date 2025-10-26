//
//  ButtonView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka on 26.10.2025.
//

import SwiftUI

struct ButtonView: View {
    @Binding var title: String
    @Binding var disabled: Bool
    
    let color: Color
    let action: () -> Void
    
    init(
        title: Binding<String>,
        disabled: Binding<Bool> = .constant(false),
        color: Color,
        action: @escaping () -> Void
    ) {
        self._title = title
        self._disabled = disabled
        self.color = color
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .disabled(disabled)
        .buttonAppearance(color)
    }
}

#Preview {
    ButtonView(
        title: .constant("Button"),
        disabled: .constant(false),
        color: .blue,
        action: { }
    )
}
