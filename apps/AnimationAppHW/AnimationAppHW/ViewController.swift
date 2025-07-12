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
        animationView.animation = nextAnimation?.preset ?? "wobble"
        animationView.curve = nextAnimation?.curve ?? "easeIn"
        animationView.duration = nextAnimation?.duration ?? 1
        animationView.force = nextAnimation?.force ?? 1
        animationView.
    }
    
    private func updateNextAnimation() {
        let preset = AnimationPreset.allCases.randomElement()?.rawValue ?? ""
        let curve = AnimationCurve.allCases.randomElement()?.rawValue ?? ""
        let duration = Double.random(in: 0...2)
        let force = Double.random(in: 0...2)
        let damping = Double.random(in: 0...1)
        let velocity = Double.random(in: 0...2)
        nextAnimation = Animation(preset: preset, curve: curve, duration: duration, force: force, damping: damping, velocity: velocity)
    }
    
    private func updateLabel() {
        animationLabel.text = """
        Animation: \(animationView.animation)
        Curve: \(animationView.curve)
        Duration: \(animationView.duration)
        Force: \(animationView.force)
        Damping: \(animationView.damping)
        """
    }
    
    private func updateButtonText() {
        button.setTitle("Animate \(nextAnimation?.preset ?? "")", for: .normal)
    }
}

