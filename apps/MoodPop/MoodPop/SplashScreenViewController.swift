//
//  SplashScreenViewController.swift
//  MoodPop
//
//  Created by egigoka on 03.07.2025.
//

import UIKit

class SplashScreenViewController: UIViewController {

    @IBOutlet var bubbleView: UIView!
    @IBOutlet var ratioBubbleConstraint: NSLayoutConstraint!
    @IBOutlet var tapView: UIView!
    @IBOutlet var ratioTapConstraint: NSLayoutConstraint!
    
    var debugBubbleTapCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(bubbleTapped))
        tapView.isUserInteractionEnabled = true
        tapView.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        modifyBubble(toSize: 3, toAlpha: 1, withDuration: 1, recursive: true)
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
        bubbleView.layer.cornerRadius = bubbleView.frame.height / 2
        tapView.layer.cornerRadius = tapView.frame.height / 2
    }
    
    private func debugBubbleConstraints() {
        print("debug")
        for constraint in bubbleView.constraints {
            print("bubble", constraint)
        }
        for constraint in view.constraints {
            print("main view", constraint)
        }
        print("debug END")
    }
    
    private func updateBubbleConstraint(toSize multiplier: CGFloat){
        guard let ratioBubbleConstraintFirstItem = ratioBubbleConstraint.firstItem as? UIView else {
            return
        }
        
        let newRatioBubbleConstraint = ratioBubbleConstraint.constraintWithMultiplier(multiplier)
        ratioBubbleConstraintFirstItem.removeConstraint(ratioBubbleConstraint)
        view.addConstraint(newRatioBubbleConstraint)
        
        ratioBubbleConstraint = newRatioBubbleConstraint
    }
    
    private func modifyBubble(
        toSize multiplier: CGFloat,
        toAlpha alpha: CGFloat,
        withDuration duration: TimeInterval,
        recursive: Bool = false
    ) {
        guard let ratioTapConstraintFirstItem = ratioTapConstraint.firstItem as? UIView else {
            return
        }
        
        updateBubbleConstraint(toSize: multiplier)
        
        // animation with resizing and alpha changing
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5,
                       options: [.curveLinear],
                       animations: {
                self.view.layoutIfNeeded()
                self.bubbleView.alpha = alpha
            },
                           completion: {finished in
                guard !recursive else { return }
                self.bubblePopped(finished)
            }
        )
        
        // update tap area view
        let newRatioTapConstraint = ratioTapConstraint.constraintWithMultiplier(multiplier)
        ratioTapConstraintFirstItem.removeConstraint(ratioTapConstraint)
        view.addConstraint(newRatioTapConstraint)
        
        // update constraint class variables
        ratioTapConstraint = newRatioTapConstraint
        
    }
    
    private func bubblePopped (_ finished: Bool) {
        // changing main view and bubble colors
        bubbleView.alpha = 0
        let mainBackgroundColor = view.backgroundColor
        view.backgroundColor = bubbleView.backgroundColor
        bubbleView.backgroundColor = mainBackgroundColor
        
        // make bubble small
        updateBubbleConstraint(toSize: 999)
        self.view.layoutIfNeeded()
        
        // animating "new" bubble expansion
        modifyBubble(toSize: 3, toAlpha: 1, withDuration: 0.2, recursive: true)
    }

    @objc func bubbleTapped() {
        debugBubbleTapCounter += 1
        print("Bubble tapped! \(debugBubbleTapCounter)")
        modifyBubble(toSize: 0.3, toAlpha: 1, withDuration: 0.5)
    }
    
}
