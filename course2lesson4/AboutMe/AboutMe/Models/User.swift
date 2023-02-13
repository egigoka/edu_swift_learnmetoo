//
//  User.swift
//  AboutMe
//
//  Created by egigoka on 13/2/2023.
//

import Foundation

struct User {
    let username: String
    let password: String
}

extension User {
    static func getDefaultUser() -> User {
        return User(username: "root", password: "toor")
    }
}
