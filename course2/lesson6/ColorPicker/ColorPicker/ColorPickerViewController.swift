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
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var delegate: ColorPickerViewControllerDelegate!
    var color: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        colorView.layer.cornerRadius = 10
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        setColor(color)
        
        setSliders()
        setValueForLabels(for: redLabel, greenLabel, blueLabel)
        setValueForTextFields(for: redTextField, greenTextField, blueTextField)
    }
    
    @IBAction func rgbSliderAction(_ sender: UISlider) {
        setColor(getCurrentColorFromSliders())
        
        switch sender.tag {
        case 0: redLabel.text = format(from: sender)
        case 1: greenLabel.text = format(from: sender)
        case 2: blueLabel.text = format(from: sender)
        default: break
        }
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        if let color = colorView.backgroundColor {
            delegate.updateColor(color)
        }
        dismiss(animated: true)
    }
    
    private func setSliders() {
        let colorValues = getColorValuesView(of: colorView)
        redSlider.value = Float(colorValues.red)
        greenSlider.value = Float(colorValues.green)
        blueSlider.value = Float(colorValues.blue)
    }
    
    private func getCurrentColorFromSliders() -> UIColor {
        UIColor(red: CGFloat(redSlider.value),
                green: CGFloat(greenSlider.value),
                blue: CGFloat(blueSlider.value),
                alpha: 1)
    }
    
    private func getColorValuesView(of view: UIView) -> (red: CGFloat, green: CGFloat, blue: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        view.backgroundColor?.getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        return (red, green, blue)
    }
    
    private func setColor(_ color: UIColor) {
        colorView.backgroundColor = color
    }
    
    private func format(from slider: UISlider) -> String {
        String(format: "%.2f", CGFloat(slider.value))
    }
    
    private func setValueForLabels(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = format(from: redSlider)
            case 1: greenLabel.text = format(from: greenSlider)
            case 2: blueLabel.text = format(from: blueSlider)
            default: break
            }
        }
    }
    
    private func setValueForTextFields(for textFields: UITextField...) {
        textFields.forEach( { textField in
            switch textField.tag {
            case 0: redTextField.text = format(from: redSlider)
            case 1: greenTextField.text = format(from: greenSlider)
            case 2: blueTextField.text = format(from: blueSlider)
            default: break
            }
        })
    }
    
    
}

