//
//  ViewController.swift
//  UnitTestingApp
//
//  Created by egigoka2kz on 13.09.2026.
//

import UIKit

class ViewController: UIViewController {

    private var volume = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setVolume(to: 101)
    }

    func setVolume(to value: Int) {
        volume = max(value, 0)
        volume = min(value, 100)
    }

}

