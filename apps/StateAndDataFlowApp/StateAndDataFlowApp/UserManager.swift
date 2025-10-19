//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by egigoka on 19.10.2025.
//

import Combine

class UserManager: ObservableObject {
    
    @Published var user = User()
    
    var valid: Bool {
        user.name.count >= 3
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}

struct User: Codable {
    var name = ""
    var isRegistered = false
}
