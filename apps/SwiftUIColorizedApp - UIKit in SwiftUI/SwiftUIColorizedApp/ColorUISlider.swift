//
//  ColorUISlider.swift
//  SwiftUIColorizedApp
//
//  Created by egigoka on 27.10.2025.
//  Copyright © 2025 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ColorUISlider: UIViewRepresentable {
    
    @Binding var value: Double
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 255
        slider.thumbTintColor = color
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
    
    //typealias UIViewType = UISlider
}

#Preview {
    @Previewable @State var value = 100.0
    ColorUISlider(value: $value, color: .red)
}
