//
//  RegisteredView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka on 19.10.2025.
//

import SwiftUI

struct RegisteredView: View {
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        
        VStack {
            Spacer()
            UserNameTextField(userName: $user.user.name, userValid: user.valid)
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            .disabled(!user.valid)
            Spacer()
        }
        .padding()
    }
    
    private func registerUser() {
        if !user.user.name.isEmpty {
            user.user.isRegistered = true
        }
    }
}

struct UserNameTextField: View {
    @Binding var userName: String
    let userValid: Bool
    
    var body: some View {
        HStack {
            TextField("Enter your name", text: $userName)
                .multilineTextAlignment(.center)
                .autocorrectionDisabled()
            Text("\(userName.count)")
                .foregroundStyle(userValid ? .green : .red)
                .padding()
        }
    }
}

#Preview {
    RegisteredView()
        .environmentObject(UserManager())
}
