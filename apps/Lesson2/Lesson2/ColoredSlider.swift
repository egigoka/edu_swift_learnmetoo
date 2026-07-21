//
//  SwiftUIView.swift
//  Lesson2
//
//  Created by egigoka2kz on 21.07.2026.
//

import SwiftUI

struct ColoredSlider: View {
    
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack {
            Text("0")
                .foregroundStyle(.red)
            Slider(value: $value)
            Text("255")
                .foregroundStyle(.red)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ColoredSlider(value: .constant(0.5), color: .red)
}
