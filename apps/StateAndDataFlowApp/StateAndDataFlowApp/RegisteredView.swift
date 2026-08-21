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
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
            Button(action: reggisterUser) {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Ok")
                }
            }
            .buttonStyle(.borderedProminent)

        }
    }
    
    private func reggisterUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegistered = true
        }
    }
}

#Preview {
    RegisteredView()
}
