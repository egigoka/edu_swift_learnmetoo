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
            UserNameTextField()
        }
        
        VStack {
            Spacer()
            VStack {
                
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

struct UserNameTextField: View {
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        HStack {
            TextField("Enter your name", text: $user.user.name)
                .multilineTextAlignment(.center)
                .autocorrectionDisabled()
            Text("\(user.user.name.count)")
                .foregroundStyle(user.valid ? .green : .red)
                .padding()
        }
    }
}

#Preview {
    RegisteredView()
        .environmentObject(UserManager())
}
