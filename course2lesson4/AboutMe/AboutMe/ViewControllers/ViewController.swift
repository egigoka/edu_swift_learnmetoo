//
//  ViewController.swift
//  AboutMe
//
//  Created by egigoka on 10/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bottomButtonsStackViewBottomConstraint:
                    NSLayoutConstraint!
    @IBOutlet weak var mainStackViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var bottomButtionsStackView: UIStackView!

    @IBOutlet var debugLabel: UILabel!
    private var keyboardIsShown = false
    private var constraintMagicNumber: CGFloat = 175

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        self.mainStackViewHeightConstraint?.constant = self.view.frame.height - constraintMagicNumber

        NotificationCenter.default.addObserver(self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        print("added observers")
    }

    override func viewWillDisappear(_ animated: Bool) {
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController
        else {
            return
        }
        guard let tabBarControllerCount = tabBarController.viewControllers?.count else {
            return
        }
        guard tabBarControllerCount >= 2 else {
            return
        }
        guard let secondViewController = tabBarController.viewControllers?[1] else {
            return
        }
        guard let destinationViewController = secondViewController as? DestinationViewController else {
            return
        }
        
        tabBarController.selectedViewController = destinationViewController
        
        
        
    }

    // Called when the keyboard is about to be hidden
    @objc func keyboardWillHide(notification: NSNotification) {
        let keyboardHeight = getKeyboardHeight(notification: notification)

        if keyboardIsShown {
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: [.curveEaseInOut],
                           animations: {
                self.mainStackViewHeightConstraint?.constant =
                    self.view.frame.height - self.constraintMagicNumber
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        keyboardIsShown = false
        print("kis", keyboardIsShown,
              "self.mainStackViewHeightConstraint?.constant", self.mainStackViewHeightConstraint?.constant ?? 0,
              "self.view.frame.height",
              self.view.frame.height,
              "self.constraintMagicNumber",
              self.constraintMagicNumber,
              "keyboardHeight", keyboardHeight)
    }

    // Called when the keyboard is about to be shown
    @objc func keyboardWillShow(notification: NSNotification) {
        // Get the keyboard height
        let keyboardHeight = getKeyboardHeight(notification: notification)
        
        print(notification)
        
        // Move your elements up by the keyboard height
        if !keyboardIsShown {
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: [.curveEaseInOut],
                           animations: {
                self.mainStackViewHeightConstraint?.constant -= keyboardHeight
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        keyboardIsShown = true
        print("kis", keyboardIsShown,
              "self.mainStackViewHeightConstraint?.constant", self.mainStackViewHeightConstraint?.constant ?? 0,
              "keyboardHeight", keyboardHeight)
    }

    // Helper method to get the keyboard height from a notification
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        if let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
        //if let keyboardSize = userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue {
          return keyboardSize.cgRectValue.height - self.view.safeAreaInsets.bottom
        } else {
            return CGFloat(0)
        }
    }

    @IBAction func usernameTextFieldPrimaryAction() {
        passwordTextField.becomeFirstResponder()
    }
    
    @IBAction func passwordTextFieldPrimaryAction() {
        logInButtonPrimaryAction()
    }
    
    @IBAction func forgotUsernameButtonPrimaryAction() {
        let alertController = UIAlertController(title: "Sorry about that", message: "Your username is \"root\"", preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)

        self.present(alertController, animated: true)
    }

    @IBAction func forgotPasswordButtonPrimaryAction() {
        let alertController = UIAlertController(title: "Sorry about that", message: "Your username is \"toor\"", preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)

        self.present(alertController, animated: true)
    }
    
    func loginFailed() {
        let alertController = UIAlertController(title: "Sorry about that", message: "Username and password pair is incorrect.", preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)

        self.present(alertController, animated: true)
        
        passwordTextField.text = ""
    }
    
    func loginSuccess() {
        performSegue(withIdentifier: "logIn", sender: self)
        
        passwordTextField.text = ""
        usernameTextField.text = ""
        usernameTextField.becomeFirstResponder()
        
    }
    
    @IBAction func logInButtonPrimaryAction() {
        
        if let usernameTextFieldText = usernameTextField?.text, let passwordTextFieldText = passwordTextField?.text{
            if usernameTextFieldText == "root" && passwordTextFieldText == "toor" {
                loginSuccess()
            } else {
                loginFailed()
            }
        } else {
            loginFailed()
        }
        
    }
}

class DestinationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad DestinationViewController")
    }
}
