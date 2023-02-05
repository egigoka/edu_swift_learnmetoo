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

    private var keyboardIsShown = false
    private var constraintMagicNumber: CGFloat = 175

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

    // Called when the keyboard is about to be hidden
    @objc func keyboardWillHide(notification: NSNotification) {
        let keyboardHeight = getKeyboardHeight(notification: notification)

        if keyboardIsShown {
            let previousFrame = view.frame
            var newFrame: CGRect = view.frame
            newFrame.size.height = previousFrame.height + keyboardHeight
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
    }

    // Called when the keyboard is about to be shown
    @objc func keyboardWillShow(notification: NSNotification) {
        // Get the keyboard height
        let keyboardHeight = getKeyboardHeight(notification: notification)

        // Move your elements up by the keyboard height
        if !keyboardIsShown {
            let previousFrame = view.frame
            var newFrame: CGRect = self.view.frame

            newFrame.size.height = previousFrame.height - keyboardHeight
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: [.curveEaseInOut],
                           animations: {
                self.mainStackViewHeightConstraint?.constant -= keyboardHeight
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        keyboardIsShown = true
        print()
    }

    // Helper method to get the keyboard height from a notification
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        if let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            return keyboardSize.cgRectValue.height
        } else {
            return CGFloat(0)
        }
    }

    @IBAction func usernameTextFieldPrimaryAction() {
        passwordTextField.becomeFirstResponder()
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
}
