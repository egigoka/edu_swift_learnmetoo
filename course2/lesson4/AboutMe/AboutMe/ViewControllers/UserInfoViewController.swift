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
        print(label.text ?? "")
        label.text = String(format: labelText, arguments: arguments)
        print(label.text ?? "")
        
        let existingString = "Hello, %@! Welcome to %@."
        
        let name = "Alice"
        let place = "Wonderland"
        let finalString = String(format: existingString, name, place)
        print(finalString)  // Output: "Hello, Alice! Welcome to Wonderland."
    }
}

class UserInfoFirstViewController: UserInfoViewController {
    
    // MARK: IB Outlets
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var helloLabel: UILabel!
    
    // MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: user.imageName)
        imageView.layer.cornerRadius = 30
        
        //helloLabel.text = String(format: helloLabel, <#T##arguments: any CVarArg...##any CVarArg#>)
        
        formatStringInLabel(helloLabel, user.username)
        helloLabel.text = String(format: helloLabel.text ?? "", user.username)
    }
    
    
}


class UserInfoSecondViewController: UserInfoViewController {
    
    // MARK: IB Outlets
    
   
    
    // MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}

class UserInfoThirdViewController: UserInfoViewController {
    
    // MARK: IB Outlets
    
   
    
    // MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}
