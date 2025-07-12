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
        originCoordinate = coreAnimationView.frame.origin.x
    }

    @IBAction func coreAnimationButtonPressed(_ sender: UIButton) {
        sender.pulsate()
        guard originCoordinate == coreAnimationView.frame.origin.x else { return }
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.autoreverse, .repeat]) {
            if self.coreAnimationView.frame.origin.x == self.originCoordinate {
                self.coreAnimationView.frame.origin.x -= 40
                self.originCoordinate = 0
            }
        }
        
        print(originCoordinate ?? 0)
        print(coreAnimationView.frame.origin.x)
    }
    
    @IBAction func springAnimationButtonPressed(_ sender: SpringButton) {
        
        
    }
    
    
}
