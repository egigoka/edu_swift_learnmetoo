//
//  ColorSlider.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 11.10.2025.
//

import SwiftUI

struct ColorSlider: View {
    @Binding var value: Double
    @Binding var inputValue: String
    var onError: () -> Void
    
    var body: some View {
        HStack {
            Slider(value: $value, in: 0...255, step: 1) {
                EmptyView()
            } minimumValueLabel: {
                Text("\(Int(value))")
                    .monospacedDigit()
            } maximumValueLabel: {
                Text("")
            }
            .onChange(of: value) { _, newValue in
                inputValue = "\(Int(value))"
            }
            TextField("", text: $inputValue)
                .onSubmit {
                    if let inputValue = Double(inputValue)
                    {
                        value = inputValue
                    } else {
                        inputValue = ""
                        onError()
                    }
                }
        }
        .scaledToFill()
        .padding()
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
    @Previewable @State var value: Double = Double.random(in: 0...255)
    @Previewable @State var inputValue: String = ""
    ColorSlider(value: $value, inputValue: $inputValue, onError: {})
}
