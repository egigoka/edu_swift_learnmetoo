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
        
        var parent: Parent?
        parent = Parent()
        parent = nil
    }
}

class Parent {
    
    let child = Child()
    
    deinit {
        print("Parent has been dealocated")
    }
}

class Child {
    deinit {
        print("Child has been dealocated")
    }
}
