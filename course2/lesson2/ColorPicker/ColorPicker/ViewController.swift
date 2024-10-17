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
    }
    
    @IBAction func redSliderAction() {
        let red = CGFloat(redSlider.value)
        let (_, green, blue) = getCurrentColor(of: colorView)
        setColor(for: colorView, red: red, green: green, blue: blue)
        updateTitle(for: redLabel, with: red)
    }
    
    @IBAction func greenSliderAction() {
        let green = CGFloat(greenSlider.value)
        let (red, _, blue) = getCurrentColor(of: colorView)
        setColor(for: colorView, red: red, green: green, blue: blue)
        updateTitle(for: greenLabel, with: green)
    }
    
    @IBAction func blueSliderAction() {
        let blue = CGFloat(blueSlider.value)
        let (red, green, _) = getCurrentColor(of: colorView)
        setColor(for: colorView, red: red, green: green, blue: blue)
        updateTitle(for: blueLabel, with: blue)
    }
    
    private func getCurrentColor(of view: UIView) -> (red: CGFloat, green: CGFloat, blue: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        view.backgroundColor?.getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        return (red, green, blue)
    }
    
    private func setColor(for view: UIView, red: CGFloat, green: CGFloat, blue: CGFloat) {
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }
    
    private func updateTitle(for label: UILabel, with value: CGFloat) {
        label.text = String(format: "%.2f", value)
    }
    
}

