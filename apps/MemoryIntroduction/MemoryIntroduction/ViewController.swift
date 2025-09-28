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
        
        label.isHidden = true
        
//        var person: Person?
//        var job: Job?
//        
//        person = Person()
//        job = Job()
//        
//        person?.job = job
//        job?.person = person
//        
//        person = nil
//        job = nil
    }
}

//// Parent
//class Person {
//    
//    var job: Job?
//    
//    init() {
//        print("Person has been created")
//    }
//    
//    deinit {
//        print("Person has been dealocated")
//    }
//}
//
//// Child
//class Job {
//    
//    weak var person: Person?
//    
//    init() {
//        print("Job has been created")
//    }
//    
//    deinit {
//        print("Job has been dealocated")
//    }
//}
