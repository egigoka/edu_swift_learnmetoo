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
    let coordinator: Coordinator
    let opacity: CGFloat
    
    init(currentValue: Binding<Float>, targetValue: Int, opacity: Float) {
        self._currentValue = currentValue
        self.targetValue = targetValue
        self.coordinator = Coordinator(currentValue: currentValue)
        self.opacity = CGFloat(opacity)
    }
    
    class Coordinator {
        @Binding var currentValue: Float
        
        init(currentValue: Binding<Float>) {
            self._currentValue = currentValue
        }
        
        @objc func onSliderChange(_ sender: UISlider) {
            currentValue = sender.value
            
        }
    }
    
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
        slider.value = currentValue
        slider.thumbTintColor = .red.withAlphaComponent(opacity)
        slider.addTarget(context.coordinator,
                            action: #selector(Coordinator.onSliderChange(_:)),
                            for: .valueChanged)
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) {
        guard let slider = uiViewController.view.subviews.compactMap({ $0 as? UISlider }).first else { return }
        let newTint = UIColor.red.withAlphaComponent(opacity)
        if slider.thumbTintColor != newTint {
            slider.thumbTintColor = newTint
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(currentValue: $currentValue)
    }
}

#Preview {
    @Previewable @State var currentValue: Float = 0.5
    UISliderView(currentValue: $currentValue, targetValue: 10, opacity: 0)
}
