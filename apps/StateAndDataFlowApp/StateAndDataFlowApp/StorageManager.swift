//
//  StorageManager.swift
//  StateAndDataFlowApp
//
//  Created by egigoka on 19.10.2025.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let userDataKey = "userManager"
    
    private init() {}
    
    func saveUser(user: User) {
        guard let userData = try? JSONEncoder().encode(user) else { return }
        userDefaults.set(userData, forKey: userDataKey)
    }
    
    func loadUser() -> User {
        guard let userData = userDefaults.object(forKey: userDataKey) as? Data else { return User() }
        guard let user = try? JSONDecoder().decode(User.self, from: userData) else { return User() }
        return user
    }
    
    func clear(userManager: UserManager) {
        userManager.user.isRegistered = false
        userManager.user.name = ""
        userDefaults.removeObject(forKey: userDataKey)
    }
}
