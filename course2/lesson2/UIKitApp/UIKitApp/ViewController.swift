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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label
        mainLabel.text = ""
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        // Segmented control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        
    }

    @IBAction func segmentedControlAction() {
    }
    
    
}

