//
//  ViewController.swift
//  AnimationApp
//
//  Created by egigoka on 05.07.2025.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {

    @IBOutlet var coreAnimationView: UIView!
    @IBOutlet var springAnimationView: SpringView!
    
    private var originCoordinate: CGFloat?
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if originCoordinate == nil ||  originCoordinate != 0 {
            originCoordinate = coreAnimationView.frame.origin.x
            print("updated")
        }
    }

    @IBAction func coreAnimationButtonPressed(_ sender: UIButton) {
        sender.pulsate()
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.autoreverse, .repeat]) {
            if self.coreAnimationView.frame.origin.x == self.originCoordinate {
                self.coreAnimationView.frame.origin.x -= 40
            }
        }
        originCoordinate = 0
    }
    
    @IBAction func springAnimationButtonPressed(_ sender: SpringButton) {
        springAnimationView.animation = "wobble"
        springAnimationView.curve = "easeIn"
        springAnimationView.duration = 1
        springAnimationView.animate()
        
        sender.animation = "shake"
        sender.animate()
    }
    
    
}
