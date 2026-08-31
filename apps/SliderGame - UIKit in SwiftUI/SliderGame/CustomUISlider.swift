//
//  SwiftUIView.swift
//  SliderGame
//
//  Created by egigoka2kz on 30.08.2026.
//

import SwiftUI

struct CustomUISlider: UIViewRepresentable {
    
    @Binding var value: Double
    
    let color: UIColor
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> CustomUISlider.Coordinator {
        Coordinator(value: $value)
    }
    
    //typealias UIViewType = UISlider
}

extension CustomUISlider {
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

#Preview {
    @Previewable @State var value = 50.0
    CustomUISlider(value: $value, color: .red, alpha: 50)
}
