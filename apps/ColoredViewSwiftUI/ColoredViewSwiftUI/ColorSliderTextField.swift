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
    @State private var threeDigitWidth: CGFloat = 50
    
    var body: some View {
        TextField("", text: $textValue)
            .focused($isFocused, equals: true)
            .multilineTextAlignment(.center)
            .monospacedDigit()
            .background(
                GeometryReader { geometry in
                    Text("000")
                        .monospacedDigit()
                        .background(
                            GeometryReader { geo in
                                Color.clear.preference(
                                    key: WidthPreferenceKey.self,
                                    value: geo.size.width
                                )
                            }
                        )
                }
            )
            .onPreferenceChange(WidthPreferenceKey.self) { width in
                threeDigitWidth = width + 16 // TextField padding
            }
            .frame(width: threeDigitWidth)
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
            .background() {
                Color.red
            }
            .alert(isPresented: $alertPresent) {
                Alert(
                    title: Text("Wrong value"),
                    message: Text("Please, input a number between 0 and 255"),
                    dismissButton: .default(Text("Ok"))
                )
            }
    }
    
    private func verifyInput() {
        guard let intValue = Int(textValue), (0...255).contains(intValue) else {
            if !textValue.isEmpty {
                alertPresent = true
            }
            textValue = "\(Int(value))"
            return
        }
        value = Double(intValue)
    }
}

struct WidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    ColorSliderTextField(textValue: .constant("234"),
                         value: .constant(235))
}
