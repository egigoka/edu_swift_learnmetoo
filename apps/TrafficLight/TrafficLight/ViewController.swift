//
//  ViewController.swift
//  TrafficLight
//
//  Created by egigoka on 12/9/2024.
//

import UIKit

enum Status {
    case red
    case yellow
    case green
}

class ViewController: UIViewController {

    // MARK: - IB Outlets

    @IBOutlet var mainButton: UIButton!
    
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    // MARK: - Private Properties

    private var status = Status.green
    private var lightIsOn: CGFloat = 1
    private var lightIsOff: CGFloat = 0.3
    
    // MARK: - Override Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        mainButton.layer.cornerRadius = 10
        
        redView.alpha = lightIsOff
        yellowView.alpha = lightIsOff
        greenView.alpha = lightIsOff
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        roundColoredViews()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        // Animate corner radius during rotation
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.roundColoredViews()
        }, completion: nil) // No need to use the completion block unless you want to do something after rotation
    }
    
    // MARK: - IB Actions

    @IBAction func mainButtonPressed() {
        
        if mainButton.titleLabel?.text == "START" {
            mainButton.setTitle("NEXT", for: .normal)
        }
        
        switch status {
        case .red:
            status = .yellow
            yellowView.alpha = lightIsOn
            redView.alpha = lightIsOff
        case .yellow:
            status = .green
            greenView.alpha = lightIsOn
            yellowView.alpha = lightIsOff
        case .green:
            status = .red
            redView.alpha = lightIsOn
            greenView.alpha = lightIsOff
        }
    }
    
    // MARK: - Private Methods

    private func makeViewRound(_ view: UIView) {
        view.layer.cornerRadius = view.frame.height / 2
    }
    
    private func roundColoredViews(){
        makeViewRound(redView)
        makeViewRound(yellowView)
        makeViewRound(greenView)
    }
    
}

