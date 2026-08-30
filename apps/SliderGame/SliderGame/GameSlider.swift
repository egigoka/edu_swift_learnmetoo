//
//  SwiftUIView.swift
//  SliderGame
//
//  Created by egigoka2kz on 30.08.2026.
//

import SwiftUI

struct GameSlider: View {
    @Binding var value: Double
    let color: Color
    let alpha: CGFloat
    var body: some View {
        HStack {
            Text("0")
            CustomUISlider(value: $value, color: color, alpha: alpha)
            Text("100")
        }
    }
}

#Preview {
    @Previewable @State var value: Double = 0
    GameSlider(value: $value, color: .red, alpha: 0.5)
}
