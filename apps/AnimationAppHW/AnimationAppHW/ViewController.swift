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
        applyNextAnimation()
        updateLabel()
        updateNextAnimation()
        updateButtonText()
        animationView.animate()
    }
    
    private func updateNextAnimation() {
        let preset = AnimationPreset.allCases.randomElement()?.rawValue ?? ""
        let curve = AnimationCurve.allCases.randomElement()?.rawValue ?? ""
        let duration = Double.random(in: 0.3...2)
        let force = Double.random(in: 0.1...2)
        let damping = Double.random(in: 0.1...1)
        let velocity = Double.random(in: 0.1...2)
        nextAnimation = Animation(preset: preset, curve: curve, duration: duration, force: force, damping: damping, velocity: velocity)
    }
    
    private func updateLabel() {
        animationLabel.text = """
        Animation: \(animationView.animation)
        Curve: \(animationView.curve)
        Duration: \(String(format: "%.2f", animationView.duration))
        Force: \(String(format: "%.2f", animationView.force))
        Damping: \(String(format: "%.2f", animationView.damping))
        """
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

