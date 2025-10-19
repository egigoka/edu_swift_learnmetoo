//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by egigoka on 19.10.2025.
//

import Combine

class UserManager: ObservableObject {
    @Published var isRegistered = false
    @Published var name = ""
}
