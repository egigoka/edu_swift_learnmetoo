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
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
    }

    @IBAction func redSliderAction() {
    }
    
    @IBAction func greenSliderAction() {
    }
    
}

