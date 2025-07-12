//
//  ViewController.swift
//  AnimationAppHW
//
//  Created by egigoka on 12.07.2025.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {

    @IBOutlet var animationView: SpringView!
    @IBOutlet var animationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }

    
    func updateLabel() {
        animationLabel.text = """
        \(animationView.animation)
        \(animationView.curve)
        \(animationView.duration)
        \(animationView.force)
        \(animationView.damping)
        """
    }
}

