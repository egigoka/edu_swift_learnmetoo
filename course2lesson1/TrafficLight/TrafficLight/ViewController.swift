//
//  ViewController.swift
//  TrafficLight
//
//  Created by egigoka on 10/9/2022.
//

import UIKit

enum Status {
    case uninitialized
    case red
    case yellow
    case green
}

class ViewController: UIViewController {

    @IBOutlet var redSignalView: UIView!
    @IBOutlet var yellowSignalView: UIView!
    @IBOutlet var greenSignalView: UIView!
    @IBOutlet var startNextButton: UIButton!
    
    var status = Status.uninitialized
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNextButton.layer.cornerRadius = 10
        
        for view: UIView in [redSignalView, yellowSignalView, greenSignalView] {
            view.layer.cornerRadius = view.bounds.height / 2
        }
    }

    @IBAction func startNextButtonPressed() {
        let attributedString = NSAttributedString(string: "NEXT")
//        startNextButton.setTitle("NEXT", for: .normal)
//        startNextButton.titleLabel?.font = UIFont.systemFont(ofSize: 280.0)
        startNextButton.setAttributedTitle(attributedString, for: .normal)
        
        switch status{
        case .uninitialized:
            redSignalView.alpha = 0.3
            yellowSignalView.alpha = 0.3
            greenSignalView.alpha = 0.3
            fallthrough
        case .green:
            status = .red
            greenSignalView.alpha = 0.3
            redSignalView.alpha = 1
            break
        case .red:
            status = .yellow
            redSignalView.alpha = 0.3
            yellowSignalView.alpha = 1
            break
        case .yellow:
            status = .green
            yellowSignalView.alpha = 0.3
            greenSignalView.alpha = 1
            break
        }
    }
    
}

