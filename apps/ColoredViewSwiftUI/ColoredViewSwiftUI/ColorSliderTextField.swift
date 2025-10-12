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
    @Binding var sliderValue: Double
    
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
            .onChange(of: isFocused, { _, newValue in
                if newValue { // editing started
                    textValue = ""
                    // much smoother experience to clear before entering
                } else { // end of edit
                    verifyInput()
                }
            })
            .keyboardType(.numberPad)
            .disableAutocorrection(true)
            .alert(isPresented: $alertPresent) {
                Alert(
                    title: Text("Wrong value"),
                    message: Text("Please, input a number between 0 and 255"),
                    dismissButton: .default(Text("Ok"))
                )
            }
            .fixedDigitWidth(3, padding: 14)
    }
    
    private func verifyInput() {
        guard let intValue = Int(textValue), (0...255).contains(intValue) else {
            if !textValue.isEmpty {
                alertPresent = true
            }
            textValue = "\(Int(sliderValue))"
            return
        }
        sliderValue = Double(intValue)
    }
}


#Preview {
    ColorSliderTextField(textValue: .constant("234"),
                         sliderValue: .constant(235))
    ColorSliderTextField(textValue: .constant("88"),
                         sliderValue: .constant(235))
    ColorSliderTextField(textValue: .constant("8"),
                         sliderValue: .constant(235))
}
