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
    @State private var inputValue: String
    var color: Color
    var onError: () -> Void
    
    init(value: Binding<Double>, color: Color, onError: @escaping () -> Void) {
        _value = value
        _inputValue = State(initialValue: "\(Int(value.wrappedValue))")
        self.color = color
        self.onError = onError
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
            .tint(color)
            .onChange(of: value) { _, newValue in
                inputValue = "\(Int(value))"
            }
            
            TextField("", text: $inputValue)
                .focused($isFocused, equals: true)
                .monospacedDigit()
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    verifyInput()
                }
                .onChange(of: isFocused, { _, newValue in
                    guard !newValue else { return }
                    verifyInput()
                })
                .keyboardType(.numberPad)
                .disableAutocorrection(true)
                .frame(width: 49)
            
        }
        .backgroundStyle(.red)
    }
    
    private func verifyInput() {
        guard let inputValueAsDouble = Double(inputValue) else {
            inputValue = "\(Int(value))"
            onError()
            return
        }
        guard inputValueAsDouble <= 255, inputValueAsDouble >= 0 else {
            inputValue = "\(Int(value))"
            onError()
            return
        }
        value = inputValueAsDouble
    }
}

#Preview {
    @Previewable @State var value: Double = 235
    ColorSlider(value: $value, color: .red, onError: {})
}
