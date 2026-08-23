//
//  RegisteredView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 21.08.2026.
//

import SwiftUI

struct RegisteredView: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            UserNameTF(
                userName: $userManager.user.name,
                userNameIsValid: userManager.nameIsValid
            )
            
            .padding()
            Button(action: reggisterUser) {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Ok")
                }
            }
            .disabled(!userManager.nameIsValid)
            .buttonStyle(.borderedProminent)
        }
    }
    
    private func reggisterUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegistered = true
        }
    }
}

#Preview {
    RegisteredView()
        .environmentObject(UserManager())
}
