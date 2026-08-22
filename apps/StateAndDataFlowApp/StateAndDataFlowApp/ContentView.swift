//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 20.08.2026.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var user: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hello, \(user.name)")
                .font(.largeTitle)
                .padding()
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding()
            Spacer()
            ButtonView(timer: timer)
            Spacer()
            ColoredButton(color: .blue, label: "Logout", disabled: false) {
                user.save(name: "")
            }
        }
        .padding()
    }
}

struct ColoredButton: View {
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
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.foreground, lineWidth: 4)
        )
    }
}

struct ButtonView: View {
    
    @StateObject var timer: TimeCounter
    
    var body: some View {
        ColoredButton(
            color: timer.timerIsRunning ? .red : .blue,
            label: timer.buttonTitle,
            disabled: timer.timerIsRunning
        ) {
            timer.startTimer()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserManager())
}
