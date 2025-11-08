//
//  UISliderView.swift
//  SliderGame
//
//  Created by egigoka on 02.11.2025.
//

import SwiftUI

struct UISliderView: UIViewRepresentable {
    
    @Binding var value: Double
    
    let alpha: Int
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100

        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.onSliderChange(_:)),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ view: UISlider, context: Context) {
        let newTint = UIColor.red.withAlphaComponent(CGFloat(alpha) / 100)
        if view.thumbTintColor != newTint {
            view.thumbTintColor = newTint
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(value: $value)
    }
}

extension UISliderView {
    class Coordinator {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func onSliderChange(_ sender: UISlider) {
            value = Double(sender.value)
            
        }
    }
}

#Preview {
    @Previewable @State var value: Double = 50
    UISliderView(value: $value, alpha: 33, color: .blue)
}
