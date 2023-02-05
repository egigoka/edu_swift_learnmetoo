//
//  ViewController.swift
//  HelloWorld
//
//  Created by egigoka on 6/9/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var helloWorldLabel: UILabel!
    @IBOutlet var toggleTextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        helloWorldLabel.isHidden = true
        helloWorldLabel.textColor = .red
        toggleTextButton.layer.cornerRadius = 10
    }
    @IBAction func toggleTextButtonPressed() {
        if helloWorldLabel.isHidden {
            toggleTextButton.setTitle("Hide Text", for: .normal)
        } else {
            toggleTextButton.setTitle("Show Text", for: .normal)
        }
        helloWorldLabel.isHidden.toggle()
    }

}
