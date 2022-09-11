//
//  ViewController.swift
//  UIKitApp
//
//  Created by egigoka on 11/9/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var segmentedContol: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Lebel
        mainLabel.text = ""
    }

    @IBAction func segmentedControlAction() {
    }
    
    
}

