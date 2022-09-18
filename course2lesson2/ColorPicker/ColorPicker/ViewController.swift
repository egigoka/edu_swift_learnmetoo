//
//  ViewController.swift
//  ColorPicker
//
//  Created by egigoka on 17/9/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setParametersForColorView()
        
        setParametersForSliders()
        
        updateColors()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        updateColors()
    }
    
    @IBAction func sliderActionWithSender(_ sender: UISlider) {
        setColor()
        
        switch sender.tag {
        case 0: redLabel.text = formatFloat(sender.value)
        case 1: greenLabel.text = formatFloat(sender.value)
        case 2: blueLabel.text = formatFloat(sender.value)
        default: break
        }
    }
    
    private func updateColors() {
        colorView.layer.borderColor = UIColor.label.cgColor
    }
    
    private func setParametersForColorView() {
        colorView.layer.cornerRadius = 10
        colorView.layer.borderWidth = 1
        colorView.layer.masksToBounds = true
    }
    
    private func setParametersForSliders() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func setLabelsTexts() {
        redLabel.text = formatFloat(redSlider.value)
        greenLabel.text = formatFloat(greenSlider.value)
        blueLabel.text = formatFloat(blueSlider.value)
    }
    
    private func formatFloat(_ float: Float) -> String {
        String(format: "%.2f", float)
    }
}

