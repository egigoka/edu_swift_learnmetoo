//
//  NewUserViewModel.swift
//  ReqResAppSwiftUI
//
//  Created by egigoka on 17.08.2025.
//

import Foundation

@MainActor
final class NewUserViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    
    private let networkManager = NetworkManager.shared
    
    func addUser(to userListViewModel: UserListViewModel) {
        
    }
}
