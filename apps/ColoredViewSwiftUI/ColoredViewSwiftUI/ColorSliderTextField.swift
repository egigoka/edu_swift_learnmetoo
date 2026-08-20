//
//  ColorSliderTextField.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka2kz on 20.08.2026.
//

import SwiftUI

struct ColorSliderTextField: View {
    
    @Binding var value: Double
    @State private var isShowingAlert: Bool = false
    
    
    var body: some View {
        TextField("", value: $value, formatter: NumberFormatter()) { _ in
            checkValue()
        }
            .frame(width: 64)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .onSubmit(checkValue)
            .alert(
                "Wrong Format",
                isPresented: $isShowingAlert,
                actions: { Button("OK", role: .cancel) { } },
                message: { Text("Please enter value from 0 to 255")}
            )
    }
    
    private func checkValue() {
        guard (0...255).contains(value) else {
            isShowingAlert = true
            value = value > 255 ? 255 : 0
            return
        }
    }
}

#Preview {
    ColorSliderTextField(value: .constant(100))
}
