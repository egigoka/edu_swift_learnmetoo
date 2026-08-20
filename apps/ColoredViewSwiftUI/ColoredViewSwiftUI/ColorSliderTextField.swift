//
//  ColorSliderTextField.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka2kz on 20.08.2026.
//

import SwiftUI

struct ColorSliderTextField: View {
    
    @Binding var value: Double
    @State private var showAlert = false
    @State private var newValue = 0.0
    
    var body: some View {
        TextField("", text: textValue, onCommit: {
            value = newValue
        })
            .frame(width: 64)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .onSubmit(checkValue)
            .alert(
                "Wrong Format",
                isPresented: $showAlert,
                actions: { Button("OK", role: .cancel) { } },
                message: { Text("Please enter value from 0 to 255")}
            )
    }
    
    private func checkValue() {
        guard (0...255).contains(value) else {
            showAlert = true
            value = value > 255 ? 255 : 0
            return
        }
    }
}

extension ColorSliderTextField {
    var textValue: Binding<String> {
        Binding<String>
    }
}

#Preview {
    ColorSliderTextField(value: .constant(100))
}
