//
//  LoginViewController.swift
//  AboutMe
//
//  Created by egigoka on 27/10/2024.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: IB Outlets
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: Private properties
    private let users = User.getUsers()
    
    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            loginButtonAction()
        default:
            break
        }
        return true
    }
    
    // MARK: IB Actions
    @IBAction func loginButtonAction() {
        
        
        guard let user = users.filter({$0.login == loginTextField.text}) .first else {
            availableLoginsAlert(with: "User not found")
            return
        }
        
        guard user.password == passwordTextField.text else {
            showAlert(with: "Wrong password", and: "Try again.")
            passwordTextField.text?.removeAll()
            passwordTextField.becomeFirstResponder()
            return
        }
        
        // debug
        showAlert(with: "Success", and: "LOGIN GRANTED !!!11!!!1337")
        // debug END
    }
    
    @IBAction func forgotLoginButtonAction(_ sender: Any) {
        availableLoginsAlert(with: "No problem")
    }
    
    @IBAction func forgotPasswordButtonAction(_ sender: Any) {
        let availableLogins = avaliableLogins()
        guard let login = loginTextField.text,
              availableLogins.contains(login) else {
            availableLoginsAlert(with: "User not found")
            return
        }
        
        guard let user = users.filter({$0.login == login}) .first else {
            showAlert(with: "Something is seriously wrong",
                      and: "This shouldn't happen!")
            return
        }
        
        showAlert(with: "No problem", and: "Your password is \(user.password)")
    }
    
    // MARK: Private methods
    
    private func avaliableLogins() -> [String] {
        users.map { $0.login }
    }
    
    private func availableLoginsAlert(with title: String) {
        let logins = avaliableLogins()
        showAlert(with: title,
                  and: "Available logins:"
                  + " \(logins.joined(separator: ", "))")
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            // nothing as for now
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
