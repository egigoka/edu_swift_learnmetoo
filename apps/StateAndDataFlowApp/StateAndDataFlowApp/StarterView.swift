//
//  Starter.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 21.08.2026.
//

import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        Group {
            if user.isRegistered {
                ContentView()
            } else {
                RegisteredView()
            }
        }
        .onAppear() {
            user.load()
        }
    }
}

#Preview {
    StarterView()
        .environmentObject(UserManager())
}
