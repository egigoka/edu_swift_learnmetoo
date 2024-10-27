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
    private var user: User?
    private let goToIndexTabController = 0
    
    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// debug
        if let user = users.first {
            self.user = user
            loginTextField.text = user.login
            passwordTextField.text = user.password
        }
        /// debug END
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UserInfoTabBarController else {
            return
        }
        guard let user = user else {
            return
        }
        
        tabBarController.user = user
        
        tabBarController.selectedIndex = goToIndexTabController
        
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
        
        self.user = user
        
        performSegue(withIdentifier: "showUserInfo", sender: self)
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
    
    // MARK: Public methods
    
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
    
}

// MARK: Extensions to UIViewController

extension UIViewController {
    func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            // nothing as for now
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
