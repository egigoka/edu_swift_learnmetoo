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

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.text = "toor" //debug
        usernameTextField.text = "root" //debug
        
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

    @IBAction func usernameTextFieldPrimaryAction() {
        passwordTextField.becomeFirstResponder()
    }
    
    @IBAction func passwordTextFieldPrimaryAction() {
        logInButtonPrimaryAction()
    }
    
    @IBAction func forgotUsernameButtonPrimaryAction() {
        let alertController = UIAlertController(title: "Sorry about that", message: "Your username is \"\(User.getDefaultUser().username)\"", preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)

        self.present(alertController, animated: true)
    }

    @IBAction func forgotPasswordButtonPrimaryAction() {
        let alertController = UIAlertController(title: "Sorry about that", message: "Your password is \"\(User.getDefaultUser().password)\"", preferredStyle: .alert)

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
        
        guard let usernameTextField = usernameTextField?.text,
              let passwordTextField = passwordTextField?.text else {
            loginFailed()
            return
        }
        
        let defaultUser = User.getDefaultUser()
       
        if usernameTextField == defaultUser.username && passwordTextField == defaultUser.password {
            loginSuccess()
        } else {
            loginFailed()
        }
        
        
    }
}

class DestinationViewController: UIViewController {
    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImage.layer.cornerRadius = mainImage.frame.size.width / 10
        mainImage.clipsToBounds = true
    }
}
