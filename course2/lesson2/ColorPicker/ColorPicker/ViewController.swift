//
//  ViewController.swift
//  ColorPicker
//
//  Created by egigoka on 17/10/2024.
//

import UIKit

class ViewController: UIViewController {

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
        
        redLabel.text = format(from: redSlider)
        greenLabel.text = format(from: greenSlider)
        blueLabel.text = format(from: blueSlider)
    }
    
    @IBAction func redSliderAction() {
        setColor()
        redLabel.text = format(from: redSlider)
    }
    
    @IBAction func greenSliderAction() {
        setColor()
        greenLabel.text = format(from: greenSlider)
    }
    
    @IBAction func blueSliderAction() {
        setColor()
        blueLabel.text = format(from: blueSlider)
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
    
}

