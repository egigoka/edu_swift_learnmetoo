//
//  SwiftUIView.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka2kz on 12.08.2026.
//

import SwiftUI

struct ColorSlider: View {
    
    @State var color: Color
    @Binding var value: Double
    @State var textValue: String = ""
    
    var body: some View {
        HStack {
            Text("\(Int(value))")
                .foregroundStyle(color)
            Slider(value: $value, in: 0...255, step: 1)
                .
            TextField("", text: $textValue)
                .frame(width: 32)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

#Preview {
    ColorSlider(color: .red, value: .constant(100))
}
