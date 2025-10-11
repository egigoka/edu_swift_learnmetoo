//
//  ColorSliderTextField.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 12.10.2025.
//

import SwiftUI

struct ColorSliderTextField: View {
    @FocusState var isFocused: Bool
    @Binding var textValue: String
    @Binding var value: Double
    
    var onError: () -> Void
    
    var body: some View {
        TextField("", text: $textValue)
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
    
    private func verifyInput() {
        guard let inputValueAsDouble = Double(textValue) else {
            textValue = "\(Int(value))"
            onError()
            return
        }
        guard inputValueAsDouble <= 255, inputValueAsDouble >= 0 else {
            textValue = "\(Int(value))"
            onError()
            return
        }
        value = inputValueAsDouble
    }
}

#Preview {
    ColorSliderTextField(textValue: .constant("234"),
                         value: .constant(235),
                         onError: {})
}
