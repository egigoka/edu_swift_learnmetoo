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
    @State var alert: Bool = false
    
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
                .frame(width: 48)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onSubmit {
                    guard let intValue = Int(textValue), (0...255).contains(intValue) else {
                        alert = true
                        textValue = "\(Int(value))"
                        return
                    }
                    value = Double(intValue)
                }
                .alert(isPresented: $alert) {
                    Alert(title: Text("Please, enter a number between 0 and 255"))
                }
        }
        .onAppear() {
            textValue = "\(Int(value))"
        }
    }
}

#Preview {
    @Previewable @State var value = 100.0
    ColorSlider(color: .red, value: $value)
}
