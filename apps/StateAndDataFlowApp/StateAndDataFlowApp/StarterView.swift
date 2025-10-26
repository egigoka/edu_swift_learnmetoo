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
        if user.user.isRegistered {
            TimerView()
        } else {
            RegisterView()
                .hideKeyboardWhenTapped()
        }
    }
}

#Preview {
    StarterView()
        .environmentObject(UserManager())
}
