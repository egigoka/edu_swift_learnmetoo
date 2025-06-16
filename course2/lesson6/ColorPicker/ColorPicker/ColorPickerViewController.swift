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
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
        addDoneButton(to: redTextField, greenTextField, blueTextField)
    }
    
    func addDoneButton(to textFields: UITextField...) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(doneButtonTapped)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        toolbar.items = [flexBarButton, doneButton]
        
        for textField in textFields {
            textField.inputAccessoryView = toolbar
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
        
        switch sender.tag {
        case 0:
            setValue(for: redLabel)
            setValue(for: redTextField)
        case 1:
            setValue(for: greenLabel)
            setValue(for: greenTextField)
        case 2:
            setValue(for: blueLabel)
            setValue(for: blueTextField)
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
            redSlider.setValue(floatValueOfSender, animated: true)
            redTextField.text = format(from: redSlider)
        case 1:
            greenLabel.text = sender.text
            greenSlider.setValue(floatValueOfSender, animated: true)
            greenTextField.text = format(from: greenSlider)
        case 2:
            blueLabel.text = sender.text
            blueSlider.setValue(floatValueOfSender, animated: true)
            blueTextField.text = format(from: blueSlider)
        default: break
        }
        
        setColor(getCurrentColorFromSliders())
        
    }
    
    
    
    @IBAction func doneButtonAction(_ sender: Any) {
        delegate?.setColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    private func setSliders() {
        let ciColor = CIColor(color: color)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func getCurrentColorFromSliders() -> UIColor {
        UIColor(red: CGFloat(redSlider.value),
                green: CGFloat(greenSlider.value),
                blue: CGFloat(blueSlider.value),
                alpha: 1)
    }
    
    private func setColor(_ color: UIColor) {
        colorView.backgroundColor = color
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
    
    private func setValue(for textFields: UITextField...) {
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
