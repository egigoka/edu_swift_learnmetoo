//
//  LoginViewController.swift
//  AboutMe
//
//  Created by egigoka on 27/10/2024.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: IB Outlets
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: Private properties
    private let users = User.getUsers()
    
    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IB Actions
    @IBAction func loginButtonAction() {
        
    }
    
    @IBAction func forgotLoginButtonAction(_ sender: Any) {
        var usersString = users.compactMap {$0.login} .joined(separator: ", ")
        showAlert(with: "No problem", and: "Available users: \(usersString)")
    }
    
    @IBAction func forgotPasswordButtonAction(_ sender: Any) {
    }
    
    // MARK: Private methods
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            // nothing as for now
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
