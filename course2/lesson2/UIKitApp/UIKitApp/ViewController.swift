//
//  ViewController.swift
//  UIKitApp
//
//  Created by egigoka on 9/10/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        mainLabel.textColor = .black
        
        // Segmented control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // Slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        mainLabel.text = String(slider.value)
    }

    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .blue
        case 2:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .yellow
        default:
            mainLabel.text = ""
        }
    }
    
    @IBAction func sliderAction() {
        let currentValue = CGFloat(slider.value)
        mainLabel.text = String(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(currentValue)
    }
    
}

