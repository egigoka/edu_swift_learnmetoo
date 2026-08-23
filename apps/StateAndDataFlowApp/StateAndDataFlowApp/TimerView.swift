//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 20.08.2026.
//

import SwiftUI

struct TimerView: View {
    
    @EnvironmentObject var user: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hello, \(user.user.name)")
                .font(.largeTitle)
                .padding()
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            TimerButtonView(timer: timer)
            
            Spacer()
            
            Button {
                DataManager.shared.clear(userManager: user)
            } label: {
                Text("Logout")
                    .buttonAppearance()
            }
            .buttonAppearance(color: .blue)
        }
        .padding()
    }
}

struct TimerButtonView: View {
    
    @StateObject var timer: TimeCounter
    
    var body: some View {
        Button {
            timer.startTimer()
        } label: {
            Text(timer.buttonTitle)
                .buttonAppearance()
        }
        .buttonAppearance(color: timer.timerIsRunning ? .red : .blue)
        .disabled(timer.timerIsRunning)
    }
}

#Preview {
    TimerView()
        .environmentObject(UserManager())
}
