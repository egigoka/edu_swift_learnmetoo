//
//  ColorSliderTextField.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka2kz on 20.08.2026.
//

import SwiftUI

struct ColorSliderTextField: View {
    @Binding var textValue: String
    @Binding var value: Double
    
    @State private var isShowingAlert: Bool = false
    
    
    var body: some View {
        TextField("", text: $textValue)
            .frame(width: 64)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .onSubmit(onSubmit)
            .alert(
                "Wrong Format",
                isPresented: $isShowingAlert,
                actions: { Button("OK", role: .cancel) { } },
                message: { Text("Please enter value from 0 to 255")}
            )
    }
    
    private func onSubmit() {
        guard let intValue = Int(textValue),
                (0...255).contains(intValue) else {
            isShowingAlert = true
            textValue = "\(Int(value))"
            return
        }
        value = Double(intValue)
    }
}

#Preview {
    ColorSliderTextField(textValue: .constant("100"), value: .constant(100))
}
