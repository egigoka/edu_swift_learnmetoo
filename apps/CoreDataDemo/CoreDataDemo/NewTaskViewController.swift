//
//  NewTaskViewController.swift
//  CoreDataDemo
//
//  Created by egigoka on 06.09.2025.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    private lazy var taskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "New task"
        textField.borderStyle = .roundedRect
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSubViews()
    }
    
    private func setupSubViews() {
        setupConstraints()
        view.addSubview(taskTextField)
    }
    
    private func setupConstraints() {
        taskTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
        ])
    }
}
