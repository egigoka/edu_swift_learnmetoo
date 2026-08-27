//
//  ColorSlider.swift
//  SwiftUIColorizedApp
//
//  Created by Alexey Efimov on 26.05.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ColorSlider: View {
    
    @Binding var sliderValue: Double
    @State private var textValue = ""
    
    var color: UIColor
    
    var body: some View {
        HStack {
            SliderValueLabel(value: sliderValue)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
            //ColorUISlider(value: $sliderValue, color: color)
                .onChange(of: sliderValue) {
                    textValue = "\(lround(sliderValue))"
                }
            .accentColor(Color(color))
            
            SliderValueTF(textValue: $textValue, value: $sliderValue)
        }
        .onAppear {
            textValue = "\(lround(sliderValue))"
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
            sliderValue = Double(textValue) ?? 0
        }
    }
}

#Preview {
    @Previewable @State var sliderValue = 100.0
    ColorSlider(sliderValue: $sliderValue, color: .red)
}
