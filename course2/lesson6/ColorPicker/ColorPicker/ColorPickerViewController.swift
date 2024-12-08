//
//  ViewController.swift
//  ColorPicker
//
//  Created by egigoka on 17/10/2024.
//

import UIKit

class ColorPickerViewController: UIViewController, UITextFieldDelegate {

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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
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
        
        redTextField.delegate = self
        addDoneButtonToKeyboard(for: redTextField)
    }
    
    func addDoneButtonToKeyboard(for textFields: UITextField...) {
        let toolbar = UIToolbar()
        let textFields = [redTextField, greenTextField, blueTextField]
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        
        toolbar.items = [doneButton]
        
        for textField in textFields {
            textField?.inputAccessoryView = toolbar
        }
    }
    
    @objc func doneButtonTapped() {
        let textFields = [redTextField, greenTextField, blueTextField]
        for textField in textFields {
            textField?.resignFirstResponder()
        }
    }
    
    @IBAction func rgbSliderAction(_ sender: UISlider) {
        setColor(getCurrentColorFromSliders())
        
        let formattedValue = format(from: sender)
        
        switch sender.tag {
        case 0:
            redLabel.text = formattedValue
            redTextField.text = formattedValue
        case 1:
            greenLabel.text = formattedValue
            greenTextField.text = formattedValue
        case 2:
            blueLabel.text = formattedValue
            blueTextField.text = formattedValue
        default: break
        }
    }
    
    
    @IBAction func rgbTextFieldAction(_ sender: UITextField) {
        
        guard let floatValueOfSender = Float(sender.text ?? "0") else {
            showAlert(with: "Error", and: "How do you enter non-number value?", button: "IDK")
            return
        }
        
        guard floatValueOfSender <= 1 else {
            showAlert(with: "Error", and: "Value should be less or equal to 1", button: "OK")
            return
        }
                
        guard floatValueOfSender >= 0 else {
            showAlert(with: "Error", and: "Value should be more or equal to 0", button: "OK")
            return
        }
        
        switch sender.tag {
        case 0:
            redLabel.text = sender.text
            redSlider.value = floatValueOfSender
            redTextField.text = format(from: redSlider)
        case 1:
            greenLabel.text = sender.text
            greenSlider.value = floatValueOfSender
            greenTextField.text = format(from: greenSlider)
        case 2:
            blueLabel.text = sender.text
            blueSlider.value = floatValueOfSender
            blueTextField.text = format(from: blueSlider)
        default: break
        }
        
        setColor(getCurrentColorFromSliders())
        
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

extension ColorPickerViewController {
    func showAlert(with title: String, and message: String, button: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: button, style: .default) { _ in
            // nothing as for now, button just closes alert
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
