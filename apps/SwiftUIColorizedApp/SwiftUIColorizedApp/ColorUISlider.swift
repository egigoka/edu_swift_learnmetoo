//
//  ColorUISlider.swift
//  SwiftUIColorizedApp
//
//  Created by Alexey Efimov on 20.12.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
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
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
    
    func makeCoordinator() -> ColorUISlider.Coordinator {
        Coordinator(value: $value)
    }
}

extension ColorUISlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct ColorUISlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorUISlider(value: .constant(100), color: .red)
    }
}
