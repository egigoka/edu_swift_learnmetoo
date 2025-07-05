//
//  SplashScreenViewController.swift
//  MoodPop
//
//  Created by egigoka on 03.07.2025.
//

import UIKit

class SplashScreenViewController: UIViewController {

    @IBOutlet var bubbleView: UIView!
    @IBOutlet var ratioConstraint: NSLayoutConstraint!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        modifyBubble()
        roundBubble()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        roundBubble()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        // Animate corner radius during rotation
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.roundBubble()
        }, completion: nil) // No need to use the completion block unless you want to do something after rotation
    }
    
    private func roundBubble() {
        print(ratioConstraint.multiplier)
        bubbleView.layer.cornerRadius = bubbleView.frame.height / 2
    }
    
    private func modifyBubble(){
        guard let constraintView = ratioConstraint.firstItem as? UIView else {
            return
        }
        
        let newConstraintRatio = ratioConstraint.constraintWithMultiplier(6)
        constraintView.removeConstraint(ratioConstraint)
        view.addConstraint(newConstraintRatio)
        view.layoutIfNeeded()
        bubbleView.layoutIfNeeded()
        ratioConstraint = newConstraintRatio
        
        let newConstraintWidth = widthConstraint.constraintWithConstant(bubbleView.frame.height)
        bubbleView.removeConstraint(widthConstraint)
        bubbleView.addConstraint(newConstraintWidth)
        bubbleView.layoutIfNeeded()
        
        for constraint in bubbleView.constraints {
            print("bubble", constraint)
        }
        for constraint in view.constraints {
            print("main view", constraint)
        }
    }

}
