//
//  ColorSlider.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 11.10.2025.
//

import SwiftUI

struct ColorSlider: View {
    @FocusState var isFocused: Bool
    
    @Binding var sliderValue: Double
    @State private var textValue: String
    
    let color: Color
    
    init(sliderValue: Binding<Double>, color: Color) {
            _sliderValue = sliderValue
            _textValue = State(initialValue: "\(lround(sliderValue.wrappedValue))")
            self.color = color
        }
    
    var body: some View {
        HStack {
            Slider(value: $sliderValue,
                   in: 0...255,
                   step: 1,
                   label: emptyView,
                   minimumValueLabel: sliderText,
                   maximumValueLabel: emptyView
            )
            .accentColor(color)
            .onChange(of: sliderValue) {
                textValue = "\(lround(sliderValue))"
            }
            
            ColorSliderTextField(textValue: $textValue,
                                 sliderValue: $sliderValue)
        }
    }
    
    private func sliderText() -> AnyView {
        AnyView(
            Text("\(Int(sliderValue))")
                .monospacedDigit()
                .fixedDigitWidth(3)
        )
    }
    
    private func emptyView() -> AnyView {
        AnyView(EmptyView())
    }
}

#Preview {
    @Previewable @State var value: Double = 235
    ColorSlider(sliderValue: $value, color: .red)
    ColorSlider(sliderValue: .constant(0), color: .red)
}
