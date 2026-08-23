//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 21.08.2026.
//

import Combine
import SwiftUI

class UserManager: ObservableObject {
    @Published var user = User()
    
    var nameIsValid: Bool {
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
