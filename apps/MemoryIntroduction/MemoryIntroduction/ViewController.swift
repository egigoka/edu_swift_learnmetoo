//
//  ViewController.swift
//  MemoryIntroduction
//
//  Created by egigoka on 28.09.2025.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var label: UILabel!
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let person = "Alexey"
        let age = 40
        
        label.text = "Name: \(person), age: \(age)"
    }
}

