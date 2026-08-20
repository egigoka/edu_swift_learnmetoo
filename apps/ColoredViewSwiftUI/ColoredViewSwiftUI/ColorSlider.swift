//
//  SwiftUIView.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka2kz on 12.08.2026.
//

import SwiftUI

struct ColorSlider: View {
    
    @State var color: Color
    @Binding var value: Double
    @State var textValue: String = ""
    @State var isShowingAlert: Bool = false
    
    var body: some View {
        HStack {
            Text("\(Int(value))")
                .foregroundStyle(color)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: value) { oldValue, newValue in
                    textValue = "\(Int(value))"
                }
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
        .onAppear() {
            textValue = "\(Int(value))"
        }
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
    @Previewable @State var value = 100.0
    ColorSlider(color: .red, value: $value)
}
