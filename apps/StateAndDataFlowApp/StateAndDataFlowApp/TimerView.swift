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
            ColoredButtonView(color: .blue, label: "Logout", disabled: false) {
                DataManager.shared.clear(userManager: user)
            }
        }
        .padding()
    }
}

struct ColoredButtonView: View {
    let color: Color
    let label: String
    let disabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
        }
        .disabled(disabled)
        
    }
}

struct TimerButtonView: View {
    
    @StateObject var timer: TimeCounter
    
    var body: some View {
        ColoredButtonView(
            color: timer.timerIsRunning ? .red : .blue,
            label: timer.buttonTitle,
            disabled: timer.timerIsRunning
        ) {
            timer.startTimer()
        }
    }
}

#Preview {
    TimerView()
        .environmentObject(UserManager())
}
