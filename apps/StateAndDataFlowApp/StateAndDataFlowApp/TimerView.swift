//
//  TimerView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka on 12.10.2025.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var user: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(user.user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Spacer()
            ButtonView(
                title: $timer.buttonTitle,
                disabled: $timer.buttonDisabled,
                color: .red
            ) {
                timer.startTimer()
            }
            Spacer()
            ButtonView(
                title: .constant("Logout"),
                color: .black
            ) {
                StorageManager.shared.clear(userManager: user)
            }
        }
        .padding()
    }
}

#Preview {
    TimerView()
        .environmentObject(UserManager())
}
