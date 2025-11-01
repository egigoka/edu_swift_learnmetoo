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
    
    init(currentValue: Binding<Float>, targetValue: Int) {
        self._currentValue = currentValue
        self.targetValue = targetValue
        self.coordinator = Coordinator(currentValue: currentValue)
    }
    
    class Coordinator {
        @Binding var currentValue: Float
        
        init(currentValue: Binding<Float>) {
            self._currentValue = currentValue
        }
        
        @objc func onSliderChange(_ value: Float) {
            currentValue = value
        }
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let viewController = UIViewController()
        let slider = UISlider()
        viewController.view.addSubview(slider)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: slider, attribute: .leading, relatedBy: .equal, toItem: viewController, attribute: .leading),
            NSLayoutConstraint(item: slider, attribute: .trailing, relatedBy: .equal, toItem: viewController, attribute: .trailing)
        ])
        
        slider.maximumValue = 100
        slider.value = currentValue
        slider.thumbTintColor = .red
        slider.addTarget(self, action: #selector(coordinator.onSliderChange), for: .valueChanged)
        
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(currentValue: $currentValue)
    }
}

#Preview {
    @Previewable @State var currentValue: Float = 0
    UISliderView(currentValue: $currentValue, targetValue: 10)
}
