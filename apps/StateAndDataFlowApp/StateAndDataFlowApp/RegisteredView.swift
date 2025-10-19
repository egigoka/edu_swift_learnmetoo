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
            HStack {
                TextField("Enter your name", text: $user.name)
                    .multilineTextAlignment(.center)
                Text("\(user.name.count)")
                    .foregroundStyle(user.name.count >= 3 ? .green : .red)
                    .padding()
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }

        }
    }
    
    private func registerUser() {
        if !user.name.isEmpty {
            user.isRegistered = true
        }
    }
}

#Preview {
    RegisteredView()
        .environmentObject(UserManager())
}
