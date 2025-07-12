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
    @IBOutlet var button: UIButton!
    
    private var nextAnimation: Animation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        updateNextAnimation()
        updateButtonText()
    }

    @IBAction func buttonPressed() {
        updateLabel()
        applyNextAnimation()
        updateNextAnimation()
        updateButtonText()
        animationView.animate()
    }
    
    private func updateNextAnimation() {
        nextAnimation = Animation.random()
    }
    
    private func updateLabel() {
        animationLabel.text = nextAnimation?.description
    }
    
    private func applyNextAnimation() {
        animationView.animation = nextAnimation?.preset ?? "wobble"
        animationView.curve = nextAnimation?.curve ?? "easeIn"
        animationView.duration = nextAnimation?.duration ?? 1
        animationView.force = nextAnimation?.force ?? 1
        animationView.damping = nextAnimation?.damping ?? 1
        animationView.velocity = nextAnimation?.velocity ?? 1
    }
    
    private func updateButtonText() {
        button.setTitle("Animate \(nextAnimation?.preset ?? "")", for: .normal)
    }
}

