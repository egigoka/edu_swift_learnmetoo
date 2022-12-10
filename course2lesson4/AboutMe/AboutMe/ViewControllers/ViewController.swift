//
//  ViewController.swift
//  AboutMe
//
//  Created by egigoka on 10/12/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bottomButtonsStackViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainStackViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var bottomButtionsStackView: UIStackView!
    
    private var keyboardIsShown = false
    private var constraintMagicNumber: CGFloat = 175
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainStackViewHeightConstraint?.constant = self.view.frame.height - constraintMagicNumber
        //self.mainStackView.spacing -= self.view.frame.height - 362
        //self.bottomButtionsStackView.spacing -= self.view.frame.width - 0
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        print("added observers")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(Date(), "touches!")
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
        print(Date(), "touches!")
        print()
    }

    // Called when the keyboard is about to be hidden
    @objc func keyboardWillHide(notification: NSNotification) {
        let keyboardHeight = getKeyboardHeight(notification: notification)

        if keyboardIsShown{
//            UIView.animate(withDuration: 10, delay: 0, options: [.curveEaseInOut], animations: {
//                self.additionalSafeAreaInsets.bottom -= keyboardHeight
//            }, completion: nil)
//            let safeArea = self.additionalSafeAreaInsets
            let previousFrame = view.frame
            var newFrame: CGRect = view.frame
            newFrame.size.height = previousFrame.height + keyboardHeight
            print(Date(), "hide before", self.view.frame.height, "kis", keyboardIsShown)
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: [.curveEaseInOut],
                           animations: {
                self.mainStackViewHeightConstraint?.constant = self.view.frame.height - self.constraintMagicNumber
                self.view.layoutIfNeeded()
                //self.bottomButtonsStackViewBottomConstraint.constant -= keyboardHeight
                //self.view.frame = newFrame
            }, completion: nil)
        }
        keyboardIsShown = false
//        print(Date(), "hide", self.additionalSafeAreaInsets.bottom, "kis", keyboardIsShown)
        print(Date(), "hide", self.view.frame.height, "kis", keyboardIsShown)
        
        
    }
    
    // Called when the keyboard is about to be shown
    @objc func keyboardWillShow(notification: NSNotification) {
        // Get the keyboard height
        let keyboardHeight = getKeyboardHeight(notification: notification)

        // Move your elements up by the keyboard height
            // Replace 'myView' with the name of the view you want to move
        if !keyboardIsShown {
//            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
//                self.additionalSafeAreaInsets.bottom += keyboardHeight
//            }, completion: nil)
//            let safeArea = self.additionalSafeAreaInsets
            let previousFrame = view.frame
            var newFrame: CGRect = self.view.frame
            
            newFrame.size.height = previousFrame.height - keyboardHeight
            print(Date(), "show before", self.view.frame.height, "kis", keyboardIsShown)
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: [.curveEaseInOut],
                           animations: {
                self.mainStackViewHeightConstraint?.constant -= keyboardHeight
                self.view.layoutIfNeeded()
                //self.bottomButtonsStackViewBottomConstraint.constant += keyboardHeight
                //self.view.frame = newFrame
            }, completion: nil)
        }
        keyboardIsShown = true
//        print(Date(), "show", self.additionalSafeAreaInsets.bottom, "kis", keyboardIsShown)
        print(Date(), "show", self.view.frame.height, "kis", keyboardIsShown)
        print()
    }

    // Helper method to get the keyboard height from a notification
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        if let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            return keyboardSize.cgRectValue.height
        }
        else {
            return CGFloat(0)
        }
    }


}

