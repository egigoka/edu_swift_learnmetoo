//
//  UISliderView.swift
//  SliderGame
//
//  Created by egigoka on 02.11.2025.
//

import SwiftUI

struct UISliderView: UIViewControllerRepresentable {
    
    @Binding var value: Float
    
    let alpha: Int
    let color: UIColor
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = UIViewController()
        guard let view = viewController.view else { return viewController }
        let slider = UISlider()
        viewController.view.addSubview(slider)
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = value
        slider.thumbTintColor = .red.withAlphaComponent(CGFloat(alpha) / 255)
        slider.addTarget(context.coordinator,
                            action: #selector(Coordinator.onSliderChange(_:)),
                            for: .valueChanged)
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) {
        guard let slider = uiViewController.view.subviews.compactMap({ $0 as? UISlider }).first else { return }
        let newTint = UIColor.red.withAlphaComponent(CGFloat(alpha) / 255)
        if slider.thumbTintColor != newTint {
            slider.thumbTintColor = newTint
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(currentValue: $value)
    }
}

extension UISliderView {
    class Coordinator {
        @Binding var currentValue: Float
        
        init(currentValue: Binding<Float>) {
            self._currentValue = currentValue
        }
        
        @objc func onSliderChange(_ sender: UISlider) {
            currentValue = sender.value
            
        }
    }
}

#Preview {
    @Previewable @State var value: Float = 0.5
    UISliderView(Value: $value, alpha: 100, color: .blue)
}
