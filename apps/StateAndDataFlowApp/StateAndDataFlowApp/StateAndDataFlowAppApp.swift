//
//  StateAndDataFlowAppApp.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 20.08.2026.
//

import SwiftUI

@main
struct StateAndDataFlowAppApp: App {
    private let user = DataManager.shared.loadUser()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager(user: user))
        }
    }
}
