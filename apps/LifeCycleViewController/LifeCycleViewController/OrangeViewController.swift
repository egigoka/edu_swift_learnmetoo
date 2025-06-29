//
//  OrangeViewController.swift
//  LifeCycleViewController
//
//  Created by Debash on 28.05.2018.
//  Copyright © 2018 swiftbook.ru. All rights reserved.
//

import UIKit

class OrangeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        printMessage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printMessage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printMessage()
    }
    
    // Срабатывает перед тем, как вью закроется
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        printMessage()
    }
    
    // Срабатывает после закрытия вью
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        printMessage()
    }
    
    // Выгружает объект из памяти
    deinit {
        printMessage()
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
