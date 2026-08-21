//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 21.08.2026.
//

import Combine

class UserManager: ObservableObject {
    @Published var isRegistered = false
    var name = ""
}
