//
//  ViewController.swift
//  HelloWorldApp
//
//  Created by egigoka on 26/8/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var helloWorldLabel: UILabel!
    
    @IBOutlet var doSomethingButton: UIButton!
    @IBOutlet var toggleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloWorldLabel.isHidden = true
        helloWorldLabel.textColor = .red
        toggleButton.layer.cornerRadius = 10
        doSomethingButton.layer.cornerRadius = 10
    }

    @IBAction func toggleTextButtonPressed() {
        if helloWorldLabel.isHidden {
            helloWorldLabel.isHidden = false
            toggleButton.setTitle("Hide text", for: .normal)
        } else {
            helloWorldLabel.isHidden.toggle()
            toggleButton.setTitle("Show text", for: .normal)
            
        }
    }
    
}

