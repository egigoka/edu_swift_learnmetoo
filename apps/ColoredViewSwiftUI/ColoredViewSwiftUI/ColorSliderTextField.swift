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
    
    @State private var alertPresent: Bool = false
    
    var body: some View {
        TextField("", text: $textValue)
            .focused($isFocused, equals: true)
            .multilineTextAlignment(.center)
            .monospacedDigit()
            .textFieldStyle(.roundedBorder)
            .onSubmit { // if there's button to commit on keyboard
                verifyInput()
            }
            .onChange(of: isFocused, { _, newValue in // on end of editing
                guard !newValue else { return }
                verifyInput()
            })
            .keyboardType(.numberPad)
            .disableAutocorrection(true)
            .frame(width: 49)
            .alert(isPresented: $alertPresent) {
                Alert(
                    title: Text("Wrong value"),
                    message: Text("Please, input a number between 0 and 255"),
                    dismissButton: .default(Text("Ok"))
                )
            }
    }
    
    private func verifyInput() {
        guard let inputValueAsDouble = Double(textValue), (0...255) else {
            textValue = "\(Int(value))"
            alertPresent = true
            return
        }
        value = inputValueAsDouble
    }
}

#Preview {
    ColorSliderTextField(textValue: .constant("234"),
                         value: .constant(235))
}
