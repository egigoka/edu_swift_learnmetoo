//
//  UserListViewModel.swift
//  ReqResAppSwiftUI
//
//  Created by egigoka on 17.08.2025.
//

import Foundation

@MainActor
final class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isPresentingNewUserView = false
    @Published var isLoading = false
    
    private let networkManager = NetworkManager.shared
}
