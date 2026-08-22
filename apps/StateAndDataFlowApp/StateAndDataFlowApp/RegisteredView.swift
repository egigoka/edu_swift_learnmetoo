//
//  RegisteredView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 21.08.2026.
//

import SwiftUI

struct RegisteredView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    private var nameValid: Bool {
        name.count > 2
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    .foregroundStyle(nameValid ? .green : .red)
            }
            .padding()
            Button(action: reggisterUser) {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Ok")
                }
            }
            .disabled(!nameValid)
            .buttonStyle(.borderedProminent)

        }
    }
    
    private func reggisterUser() {
        if !name.isEmpty {
            user.name = name
            user.save(name: name)
            print(user.isRegistered)
        }
    }
}

#Preview {
    RegisteredView()
        .environmentObject(UserManager())
}
