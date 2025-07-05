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
    var bubbleEnlarged = false
    
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
        modifyBubble(toSize: 3, toAlpha: 1, withDuration: 1)
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
    
    private func modifyBubble(
        toSize multiplier: CGFloat,
        toAlpha alpha: CGFloat,
        withDuration duration: TimeInterval
    ) {
        guard let ratioBubbleConstraintFirstItem = ratioBubbleConstraint.firstItem as? UIView else {
            return
        }
        guard let ratioTapConstraintFirstItem = ratioTapConstraint.firstItem as? UIView else {
            return
        }
        
        let newRatioBubbleConstraint = ratioBubbleConstraint.constraintWithMultiplier(multiplier)
        ratioBubbleConstraintFirstItem.removeConstraint(ratioBubbleConstraint)
        view.addConstraint(newRatioBubbleConstraint)
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5,
                       options: [.curveEaseInOut],
                       animations: {
            self.view.layoutIfNeeded()
            self.bubbleView.alpha = alpha
        },
                       completion: {finished in
            self.bubblePopped(finished)
        }
        )
        
        let newRatioTapConstraint = ratioTapConstraint.constraintWithMultiplier(multiplier)
        ratioTapConstraintFirstItem.removeConstraint(ratioTapConstraint)
        view.addConstraint(newRatioTapConstraint)
        
        ratioBubbleConstraint = newRatioBubbleConstraint
        ratioTapConstraint = newRatioTapConstraint
        
        // debug
//        for constraint in bubbleView.constraints {
//            print("bubble", constraint)
//        }
//        for constraint in view.constraints {
//            print("main view", constraint)
//        }
    }
    
    func bubblePopped (_ finished: Bool) {
        print(finished)
    }

    @objc func bubbleTapped() {
        debugBubbleTapCounter += 1
        print("Bubble tapped! \(debugBubbleTapCounter)")
        if bubbleEnlarged {
            modifyBubble(toSize: 3, toAlpha: 1, withDuration: 0.3)
        } else {
            modifyBubble(toSize: 0.9, toAlpha: 1, withDuration: 0.3)
        }
        bubbleEnlarged = !bubbleEnlarged
    }
    
}
