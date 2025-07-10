//
//  ViewController.swift
//  AnimationApp
//
//  Created by egigoka on 05.07.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var coreAnimationView: UIView!
    
    private var originCoordinate: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originCoordinate = coreAnimationView.frame.origin.x
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        originCoordinate = coreAnimationView.frame.origin.x
    }

    @IBAction func coreAnimationButtonPressed(_ sender: UIButton) {
        sender.pulsate()
        
        if coreAnimationView.frame.origin.x == originCoordinate {
            coreAnimationView.frame.origin.x -= 40
            print("moved")
        }
        
        print(originCoordinate)
        print(coreAnimationView.frame.origin.x)
    }
    
}
