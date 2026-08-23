//
//  SwiftUIView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 23.08.2026.
//

import SwiftUI

struct UserNameTF: View {
    
    @Binding var userName: String
    let userNameIsValid: Bool
    
    var body: some View {
        HStack {
            TextField("Enter your name", text: $userName)
                .multilineTextAlignment(.center)
            Text("\(userName.count)")
                .foregroundStyle(userNameIsValid ? .green : .red)
        }
    }
}

#Preview {
    UserNameTF(userName: .constant("User"), userNameIsValid: true)
}
