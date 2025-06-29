//
//  GreenViewController.swift
//  LifeCycleViewController
//
//  Created by Debash on 07.05.2018.
//  Copyright © 2018 swiftbook.ru. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {
    
    @IBOutlet var openThirdVC: UIButton!
    
    var someProperties: String!
    
    // Срабатывает после загрузки View
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GreenVC"
        printMessage()
    }
    
    // Срабатывает перед появлением вью на экране
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printMessage()
    }
    
    // Вызывается при расстановке констрейнтов
    override func updateViewConstraints() {
        printMessage()
        super.updateViewConstraints()
    }
    
    // Срабатывает перед тем, как размер вью поменяется под размер экрана
    
    // Тут срабатывает Auto Layout
    
    // Срабатывает после того, как размер вью изменился под размер эрана
    
    // Срабатывает после появления вью на экране
    
    // Срабатывает при повороте экрана
    
    // Срабатывает перед тем, как вью закроется
    
    // Срабатывает после закрытия вью
}

extension UIViewController {
    func printMessage(function: String = #function) {
        print("\(title ?? ""): \(function)")
    }
}
