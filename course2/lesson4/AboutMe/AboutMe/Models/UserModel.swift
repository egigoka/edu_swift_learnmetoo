//
//  UserModel.swift
//  AboutMe
//
//  Created by egigoka on 27/10/2024.
//

import UIKit

struct User {
    let login: String
    let password: String
    
    let username: String
    let image: UIImage?
}

extension User {
    static func getUsers() -> [User]{
        return [
            User(login: "root", password: "toor", username: "EGiGoka",
                 image: UIImage(named: "TestImage"))
        ]
    }
}
