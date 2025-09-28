//
//  SecondViewController.swift
//  MemoryIntroduction
//
//  Created by egigoka on 28.09.2025.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var alexey: Person?
        var swiftbook: Job?
        
        alexey = Person()
        swiftbook = Job()
        
        alexey?.job = swiftbook
        swiftbook?.person = alexey
        
        alexey = nil
        swiftbook = nil
    }
    
    // MARK: - IBActions
    @IBAction func closeButtonAction() {
        dismiss(animated: true)
    }
    
}
