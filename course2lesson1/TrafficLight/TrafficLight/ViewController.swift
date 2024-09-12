//
//  ViewController.swift
//  TrafficLight
//
//  Created by egigoka on 12/9/2024.
//

import UIKit

enum Status {
    case started
    case red
    case yellow
    case green
}

class ViewController: UIViewController {

    var status = Status.started
    
    @IBOutlet var mainButton: UIButton!
    
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    func makeViewRound(_ view: UIView) {
        view.layer.cornerRadius = view.frame.height / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainButton.layer.cornerRadius = 10
        makeViewRound(redView)
        makeViewRound(yellowView)
        makeViewRound(greenView)
    }

    @IBAction func mainButtonPressed() {
        redView.alpha = 0.3
        yellowView.alpha = 0.3
        greenView?.alpha = 0.3
        switch status {
        case .started:
            status = .red
            redView.alpha = 1
            mainButton.setTitle("NEXT", for: .normal)
        case .red:
            status = .yellow
            yellowView.alpha = 1
        case .yellow:
            status = .green
            greenView.alpha = 1
        case .green:
            status = .red
            redView.alpha = 1
        }
    }
    
}

