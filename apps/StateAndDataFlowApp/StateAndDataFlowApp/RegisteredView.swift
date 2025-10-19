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
            VStack {
                HStack {
                    TextField("Enter your name", text: $user.user.name)
                        .multilineTextAlignment(.center)
                        .autocorrectionDisabled()
                    Text("\(user.user.name.count)")
                        .foregroundStyle(user.valid ? .green : .red)
                        .padding()
                }
                Button(action: registerUser) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("Ok")
                    }
                }
                .disabled(!user.valid)
            }
            Spacer()
            
        }
//        .overlay(Rectangle())
    }
    
    private func registerUser() {
        if !user.user.name.isEmpty {
            user.user.isRegistered = true
        }
    }
}

#Preview {
    RegisteredView()
        .environmentObject(UserManager())
}
