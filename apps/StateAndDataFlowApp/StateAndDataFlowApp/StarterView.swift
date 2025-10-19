//
//  StarterView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka on 19.10.2025.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        Group {
            if user.user.isRegistered {
                ContentView()
            } else {
                RegisteredView()
            }
        }
    }
}

#Preview {
    StarterView()
        .environmentObject(UserManager())
}
