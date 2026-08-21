//
//  RegisteredView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 21.08.2026.
//

import SwiftUI

struct RegisteredView: View {
    @State private var name = ""
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
            Button {
                
            } label: {
                HStack {
                    Text("Register")
                    Spacer()
                    Image(systemName: "cross")
                }
            }

        }
    }
}

#Preview {
    RegisteredView()
}
