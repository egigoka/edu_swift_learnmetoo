//
//  UISliderView.swift
//  SliderGame
//
//  Created by egigoka on 02.11.2025.
//

import SwiftUI

struct UISliderView: UIViewControllerRepresentable {
    
    @Binding var currentValue: Float
    let targetValue: Int
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = UIViewController()
        let slider = UISlider()
        viewController.view.addSubview(slider)
        
        slider.maximumValue = 100
        slider.value = currentValue
        slider.thumbTintColor = .red
        slider.addTarget(self, action: #selector(onSliderChange), for: .valueChanged)
        
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) {
        
    }
    
    @objc private func onSliderChange(_ value: Float) {
        currentValue = value
    }
    
}

#Preview {
    @Previewable @State var currentValue: Float = 0
    UISliderView(currentValue: $currentValue, targetValue: 10)
}
