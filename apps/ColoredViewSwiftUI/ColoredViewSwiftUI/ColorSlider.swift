//
//  SwiftUIView.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka2kz on 12.08.2026.
//

import SwiftUI
import UIKit

struct ColorSlider: View {
    
    @Binding var value: Double
    @State private var textValue: String = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(Int(value))")
                .foregroundStyle(color)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: value) { _, _ in
                    textValue = "\(Int(value))"
                }
            ColorSliderTextField(textValue: $textValue, value: $value)
        }
        .onAppear() {
            textValue = "\(Int(value))"
        }
    }
    
    
}

#Preview {
    @Previewable @State var value = 100.0
    ColorSlider(value: $value, color: .red)
}
