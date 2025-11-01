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
        self.coordinator = Coordinator(currentValue: currentValue,
                                       targetValue: targetValue)
        self.opacity = CGFloat(opacity)
    }
    
    class Coordinator {
        @Binding var currentValue: Float
        let targetValue: Int
        
        init(currentValue: Binding<Float>, targetValue: Int) {
            self._currentValue = currentValue
            self.targetValue = targetValue
        }
        
        @objc func onSliderChange(_ sender: UISlider) {
            currentValue = sender.value
            
        }
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        print("makeUIViewController \(Date())")
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
//        slider.addTarget(self, action: #selector(coordinator.onSliderChange), for: .valueChanged)
        slider.addTarget(context.coordinator,
                            action: #selector(Coordinator.onSliderChange(_:)),
                            for: .valueChanged)
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(currentValue: $currentValue,
                           targetValue: targetValue)
    }
}

#Preview {
    @Previewable @State var currentValue: Float = 0
    UISliderView(currentValue: $currentValue, targetValue: 10, opacity: 0)
}
