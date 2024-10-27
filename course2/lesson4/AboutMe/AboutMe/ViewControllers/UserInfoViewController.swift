//
//  UserInfoViewController.swift
//  AboutMe
//
//  Created by egigoka on 27/10/2024.
//

import UIKit

class UserInfoViewController: UIViewController {
    // MARK: Public Properties
    
    var user: User!
    
    // MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("UserInfoViewController loaded")
        
        guard let tabBarController = tabBarController as? UserInfoTabBarController else {
            return
        }
        
        user = tabBarController.user
        
        ///debug
        self.user = User.getUsers().first!
        ///debug END

    }
    
    // MARK: Deinit
    deinit {
        print("UserInfoViewController deinitialized")
    }
    
    // MARK: Public methods
    func formatStringInLabel(_ label: UILabel, _ arguments: CVarArg...) {
        guard let labelText = label.text else {
            return
        }
        label.text = String(format: labelText, arguments: arguments)
    }
    
    func formatStringInButton(_ button: UIButton, _ arguments: CVarArg...) {
        
        guard let buttonTitle = button.titleLabel?.text else {
            return
        }
        
        button.setTitle(String(format: buttonTitle, arguments: arguments), for: .normal)
    }
    
}

class UserInfoFirstViewController: UserInfoViewController {
    
    // MARK: IB Outlets
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var helloLabel: UILabel!
    @IBOutlet var moodLabel: UILabel!
    @IBOutlet var goalLabel: UILabel!
    
    @IBOutlet var goalDoneButton: UIButton!
    
    // MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImage()
        formatStrings()
    }
    
    // MARK: IB Actions
    
    @IBAction func goalDoneButtonAction() {
        showAlert(with: user.goalButton + "?", and: "Good job!\nLet's pretend that we're logged that.")
    }
    
    // MARK: Private Methods
    
    private func setupImage() {
        imageView.image = UIImage(named: user.imageName)
        imageView.layer.cornerRadius = 30
    }
    
    private func formatStrings() {
        formatStringInLabel(helloLabel, user.username)
        formatStringInLabel(moodLabel, user.moodEmoji, user.mood)
        formatStringInLabel(goalLabel, user.goal)
        
        formatStringInButton(goalDoneButton, user.goalButton)
    }
    
}


class UserInfoSecondViewController: UserInfoViewController {
    
    // MARK: IB Outlets
    
    @IBOutlet var projectLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nextTaskLabel: UILabel!
    
    
    // MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImage()
        setupLabels()
    }
    
    // MARK: Private Methods
    private func setupImage() {
        print(user.projectImageName)
        imageView.image = UIImage(named: user.projectImageName)
        imageView.layer.cornerRadius = 30
    }
    
    private func setupLabels() {
        formatStringInLabel(projectLabel, user.project)
        formatStringInLabel(nextTaskLabel, user.nextTask)
    }
    
}

class UserInfoThirdViewController: UserInfoViewController {
    
    // MARK: IB Outlets
    
   
    
    // MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}
