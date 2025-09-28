//
//  SecondViewController.swift
//  MemoryIntroduction
//
//  Created by egigoka on 28.09.2025.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Private properties
    private lazy var closure: () -> Void = { [unowned self] in
        self.view.backgroundColor = .systemFill
    }
    
    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("SecondViewController init")
    }
    
    deinit {
        print("SecondViewController deinit")
    }
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closure()
//        var alexey: Person?
//        var swiftbook: Job?
//        
//        alexey = Person()
//        swiftbook = Job()
//        
//        alexey?.job = swiftbook
//        swiftbook?.person = alexey
//        
//        alexey = nil
//        swiftbook = nil
    }
    
    // MARK: - IBActions
    @IBAction func closeButtonAction() {
        dismiss(animated: true)
    }
    
    
    
}
