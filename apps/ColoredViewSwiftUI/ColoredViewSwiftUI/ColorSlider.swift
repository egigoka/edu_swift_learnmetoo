//
//  ColorSlider.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 11.10.2025.
//

import SwiftUI

struct ColorSlider: View {
    @Binding var value: Double
    @State private var inputValue: String
    var color: Color
    var onError: () -> Void
    
    init(value: Binding<Double>, color: Color, onError: @escaping () -> Void) {
        
        self._value = $value
        self._inputValue = String(Int(value))
        self.color = color
        self.onError = onError
    }
    
    var body: some View {
        HStack {
            Slider(value: $value, in: 0...255, step: 1) {
                EmptyView()
            } minimumValueLabel: {
                Text("\(Int(value))")
                    .monospacedDigit()
                    .frame(width: 35)
            } maximumValueLabel: {
                Text("")
                    .frame(width: 0, height: 0)
            }
            .tint(color)
            .onChange(of: value) { _, newValue in
                inputValue = "\(Int(value))"
            }
            
            TextField("", text: $inputValue)
                .monospacedDigit()
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    if let inputValue = Double(inputValue)
                    {
                        value = inputValue
                    } else {
                        inputValue = ""
                        onError()
                    }
                }
                .frame(width: 45)
        }
        .padding()
        .backgroundStyle(.red)
    }
//    var color: Color
//    @Binding var value: Double
//    @State private var inputValue: String
//    
//    init(color: Color, value: Binding<Double>) {
//        self.color = color
//        self._value = $value
//        self._inputValue = State(wrappedValue: String(value.wrappedValue))
//    }
//    
//    var body: some View {
//        HStack {
//            Slider(value: $value, in: 0...255, step: 1) {
//                EmptyView()
//            } minimumValueLabel: {
//                Text("\(Int(value))")
//                    .monospacedDigit()
//            } maximumValueLabel: {
//                Text("")
//            } onEditingChanged: { sliderValue in
//                print(sliderValue)
//            }
//            TextField("", text: $inputValue)
//        }
//        .padding()
//    }
}

#Preview {
    @Previewable @State var value: Double = 235
    ColorSlider(value: $value, color: .red, onError: {})
}
