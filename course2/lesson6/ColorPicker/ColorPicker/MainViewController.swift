//
//  MainViewController.swift
//  ColorPicker
//
//  Created by egigoka on 05.12.2024.
//

import UIKit

protocol ColorPickerViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorPickerVC = segue.destination as! ColorPickerViewController
        colorPickerVC.delegate = self
        colorPickerVC.color = view.backgroundColor
    }
}

// MARK: - ColorDelegate
extension MainViewController: ColorPickerViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
