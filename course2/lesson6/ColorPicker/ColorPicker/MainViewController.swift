//
//  MainViewController.swift
//  ColorPicker
//
//  Created by egigoka on 05.12.2024.
//

import UIKit

protocol ColorPickerViewControllerDelegate {
    func updateColor(_ color: UIColor)
}

class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorPickerVC = segue.destination as! ColorPickerViewController
        colorPickerVC.delegate = self
        colorPickerVC.colorView.backgroundColor = view.backgroundColor
    }
}

extension MainViewController: ColorPickerViewControllerDelegate {
    func updateColor(_ color: UIColor) {
        self.view.backgroundColor = color
    }
}
