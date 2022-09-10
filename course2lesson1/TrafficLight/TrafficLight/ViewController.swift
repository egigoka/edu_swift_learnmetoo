//
//  ViewController.swift
//  TrafficLight
//
//  Created by egigoka on 10/9/2022.
//

import UIKit

enum Status {
    case red
    case yellow
    case green
}

class ViewController: UIViewController {

    @IBOutlet var redSignalView: UIView!
    @IBOutlet var yellowSignalView: UIView!
    @IBOutlet var greenSignalView: UIView!
    
    @IBOutlet var startNextButton: UIButton!
    
    private var status = Status.green
    private var lightIsOn = 1.0
    private var lightIsOff = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNextButton.layer.cornerRadius = 10
        
        circlifySignalViews()
        
        turnOffTheLights()
        
    }
    
    func circlifySignalViews() {
        for view: UIView in [redSignalView, yellowSignalView, greenSignalView] {
            view.layer.cornerRadius = view.bounds.height / 2
        }
    }
    
    func turnOffTheLights() {
        for view: UIView in [redSignalView, yellowSignalView, greenSignalView] {
            view.alpha = lightIsOff
        }
    }

    @IBAction func startNextButtonPressed() {
        let attributedString = NSAttributedString(string: "NEXT")
//        startNextButton.setTitle("NEXT", for: .normal)
//        startNextButton.titleLabel?.font = UIFont.systemFont(ofSize: 280.0)
        startNextButton.setAttributedTitle(attributedString, for: .normal)
        
        switch status{
        case .green:
            status = .red
            greenSignalView.alpha = lightIsOff
            redSignalView.alpha = lightIsOn
            break
        case .red:
            status = .yellow
            redSignalView.alpha = lightIsOff
            yellowSignalView.alpha = lightIsOn
            break
        case .yellow:
            status = .green
            yellowSignalView.alpha = lightIsOff
            greenSignalView.alpha = lightIsOn
            break
        }
    }
    
}

