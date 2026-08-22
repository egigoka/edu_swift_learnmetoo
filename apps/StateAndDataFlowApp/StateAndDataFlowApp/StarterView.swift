//
//  Starter.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 21.08.2026.
//

import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        Group {
            if user.user.isRegistered {
                ContentView()
            } else {
                RegisteredView()
                    .onTapGesture {
                        UIApplication.shared.sendAction(
                            #selector(UIResponder.resignFirstResponder),
                            to: nil,
                            from: nil,
                            for: nil
                        )
                    }
            }
        }
    }
}

#Preview {
    StarterView()
        .environmentObject(UserManager())
}
