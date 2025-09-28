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
        
        var alexey: Person?
        var swiftbook: Job?
        
        alexey = Person()
        swiftbook = Job()
        
        alexey?.job = swiftbook
        swiftbook?.person = alexey
        
        alexey = nil
        swiftbook = nil
    }
}

class Person {
    
    var job: Job?
    
    deinit {
        print("Person has been dealocated")
    }
}

class Job {
    
    var person: Person?
    
    deinit {
        print("Job has been dealocated")
    }
}
