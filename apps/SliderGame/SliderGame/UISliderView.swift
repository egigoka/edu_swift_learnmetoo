//
//  UISliderView.swift
//  SliderGame
//
//  Created by egigoka on 02.11.2025.
//

import SwiftUI

struct UISliderView: UIViewControllerRepresentable {
    
    @Binding var value: Int
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = UIViewController()
        let slider = UISlider()
        viewController.view.addSubview(slider)
        
        slider.maximumValue = 100
        slider.value = 1
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) { }
    
}

#Preview {
    UISliderView()
}
