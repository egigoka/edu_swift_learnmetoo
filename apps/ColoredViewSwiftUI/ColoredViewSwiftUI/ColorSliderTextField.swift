//
//  ColorSliderTextField.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 12.10.2025.
//

import SwiftUI

struct ColorSliderTextField: View {
    @FocusState var isFocused: Bool
    @Binding var inputValue: String
    @Binding var value: Double
    
    var onError: () -> Void
    
    var body: some View {
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
    ColorSliderTextField(inputValue: .constant("234"),
                         value: .constant(235),
                         onError: {})
}
