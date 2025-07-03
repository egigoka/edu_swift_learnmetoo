//
//  LaunchScreenViewController.swift
//  MoodPop
//
//  Created by egigoka on 03.07.2025.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet var bubbleView: UIView!
    
    override func viewDidLayoutSubviews() {
        roundBubbleView()
    }
    
    func roundBubbleView() {
        bubbleView.layer.cornerRadius = bubbleView.frame.height / 2
    }

}
