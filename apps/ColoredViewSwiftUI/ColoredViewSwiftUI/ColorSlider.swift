//
//  ColorSlider.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 11.10.2025.
//

import SwiftUI

struct ColorSlider: View {
    @FocusState var isFocused: Bool
    
    @Binding var value: Double
    @State private var textValue: String
    var color: Color
    
    init(value: Binding<Double>, color: Color) {
            _value = value
            _textValue = State(initialValue: "\(Int(value.wrappedValue))")
            self.color = color
        }
    
    var body: some View {
        HStack {
            Slider(value: $value, in: 0...255, step: 1) {
                EmptyView()
            } minimumValueLabel: {
                AnyView(
                    Text("\(Int(value))")
                        .monospacedDigit()
                        .frame(width: 35)
                )
            } maximumValueLabel: {
                AnyView(EmptyView())
            }
            .accentColor(color)
            .onChange(of: value) { _, newValue in
                textValue = "\(Int(value))"
            }
            
            ColorSliderTextField(textValue: $textValue, value: $value)
        }
    }
}

#Preview {
    @Previewable @State var value: Double = 235
    ColorSlider(value: $value, color: .red)
}
