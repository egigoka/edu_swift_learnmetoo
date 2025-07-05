//
//  SplashScreenViewController.swift
//  MoodPop
//
//  Created by egigoka on 03.07.2025.
//

import UIKit
import AudioToolbox

class BubbleViewController: UIViewController {

    @IBOutlet var bubbleView: UIView!
    @IBOutlet var ratioBubbleConstraint: NSLayoutConstraint!
    @IBOutlet var tapView: UIView!
    @IBOutlet var ratioTapConstraint: NSLayoutConstraint!
    
    let pepTalks = PepTalk.getPepTalks()
    var pepTalkLabel: UILabel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGesture()
        addLabel()
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
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(bubbleTapped))
        tapView.isUserInteractionEnabled = true
        tapView.addGestureRecognizer(tap)
    }
    
    @objc func bubbleTapped() {
        bubbleWillPop()
    }
    
    private func bubbleDidPop() {
        makeNewBubble()
        changePepTalk()
    }
    
}

// Label logic
extension BubbleViewController {
    private func addLabel() {
        let pepTalkLabel = UILabel()
        pepTalkLabel.font = UIFont.systemFont(ofSize: 53)
        pepTalkLabel.textColor = .black
        pepTalkLabel.textAlignment = .center
        pepTalkLabel.numberOfLines = 0
        pepTalkLabel.translatesAutoresizingMaskIntoConstraints = false
        pepTalkLabel.adjustsFontSizeToFitWidth = true
        
        view.insertSubview(pepTalkLabel, belowSubview: bubbleView)
        
        
        NSLayoutConstraint.activate([
            pepTalkLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            pepTalkLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            pepTalkLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            pepTalkLabel.bottomAnchor.constraint(equalTo: tapView.topAnchor, constant: -16)
        ])
        self.pepTalkLabel = pepTalkLabel
    }
    
    private func changePepTalk() {
        guard let pepTalk = pepTalks.randomElement() else {
            return
        }
        guard let pepTalkLabel = pepTalkLabel else {
            return
        }
        pepTalkLabel.text = pepTalk.text
        pepTalkLabel.alpha = 0
        UIView.animate(withDuration: 0.3) {
            pepTalkLabel.alpha = 1
        }
    }
}

// Bubble logic
extension BubbleViewController {
    private func roundBubble() {
        bubbleView.layer.cornerRadius = bubbleView.frame.height / 2
        tapView.layer.cornerRadius = tapView.frame.height / 2
    }
    
    private func setTapView(size multiplier: CGFloat) {
        guard let ratioTapConstraintFirstItem = ratioTapConstraint.firstItem as? UIView else {
            return
        }
        
        // set new constraint
        let newRatioTapConstraint = ratioTapConstraint.constraintWithMultiplier(multiplier)
        ratioTapConstraintFirstItem.removeConstraint(ratioTapConstraint)
        view.addConstraint(newRatioTapConstraint)
        
        // update constraint class variables
        ratioTapConstraint = newRatioTapConstraint
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
                self.bubbleDidPop()
            }
        )
        
    }
    
    private func makeNewBubble() {
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
    
    private func playPopSound() {
        guard let soundURL = Bundle.main.url(
            forResource: "pop", 
            withExtension: "wav"
        ) else { return }
        var soundID: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }

    private func bubbleWillPop() {
        var bubbleSize: CGFloat = 0.9
        if view.frame.width > view.frame.height {
            bubbleSize /= view.frame.width / view.frame.height
        }
        
        playPopSound()
        modifyBubble(toSize: bubbleSize, toAlpha: 1, withDuration: 0.3)
    }
}
