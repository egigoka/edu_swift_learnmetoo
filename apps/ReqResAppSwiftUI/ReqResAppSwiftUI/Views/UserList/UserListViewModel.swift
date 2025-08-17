//
//  UserListViewModel.swift
//  ReqResAppSwiftUI
//
//  Created by egigoka on 17.08.2025.
//

import Observation

@Observable
final class UserListViewModel {
    var users: [User] = []
    var isPresentingNewUserView = false
    var isLoading = false
    
    private let networkManager = NetworkManager.shared
    
    func fetchUsers() async {
        isLoading = true
        do {
            users = try await networkManager.fetchUsers()
        } catch {
            // Error handling
            print(error.localizedDescription)
        }
        isLoading = false
    }
    
    func appendUser(_ user: User) {
        users.append(user)
    }
    
    func dismiss() {
        isPresentingNewUserView = false
    }
}
