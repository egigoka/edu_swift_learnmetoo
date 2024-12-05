//
//  ViewController.swift
//  ColorPicker
//
//  Created by egigoka on 17/10/2024.
//

import UIKit

class ColorPickerViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        setColor()
        
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    
    @IBAction func rgbSliderAction(_ sender: UISlider) {
        setColor()
        
        switch sender.tag {
        case 0: redLabel.text = format(from: sender)
        case 1: greenLabel.text = format(from: sender)
        case 2: blueLabel.text = format(from: sender)
        default: break
        }
    }
    
    private func getCurrentColor(of view: UIView) -> (red: CGFloat, green: CGFloat, blue: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        view.backgroundColor?.getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        return (red, green, blue)
    }
    
    private func setColor() {
        colorView.backgroundColor =
            UIColor(red: CGFloat(redSlider.value),
                    green: CGFloat(greenSlider.value),
                    blue: CGFloat(blueSlider.value),
                    alpha: 1)
    }
    
    private func format(from slider: UISlider) -> String {
        String(format: "%.2f", CGFloat(slider.value))
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = format(from: redSlider)
            case 1: greenLabel.text = format(from: greenSlider)
            case 2: blueLabel.text = format(from: blueSlider)
            default: break
            }
        }
    }
    
}

