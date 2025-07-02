//
//  GreenViewController.swift
//  LifeCycleViewController
//
//  Created by Debash on 07.05.2018.
//  Copyright © 2018 swiftbook.ru. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {
    
    @IBOutlet var openThirdVC: UIButton! {
        didSet {
            print("\(openThirdVC.currentTitle ?? "nil")")
        }
    }
    
    var someProperties: String! {
        didSet {
            print(someProperties ?? "nil")
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        //printMessage()
        print("GreenVC: awakeFromNib")
    }
    
    override func loadView() {
        super.loadView()
        printMessage()
    }
    
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
    override func viewWillLayoutSubviews() {
        printMessage()
    }
    
    // Тут срабатывает Auto Layout
    
    // Срабатывает после того, как размер вью изменился под размер эрана
    override func viewDidLayoutSubviews() {
        printMessage()
    }
    
    // Срабатывает после появления вью на экране
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printMessage()
    }
    
    // Срабатывает при повороте экрана
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
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
}

extension UIViewController {
    func printMessage(function: String = #function) {
        print("\(title ?? ""): \(function)")
    }
}
