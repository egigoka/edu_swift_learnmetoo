//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka on 12.10.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Spacer()
            ButtonView(timer: timer)
            Spacer()
        }
        .padding()
    }
}

struct ButtonView: View {
    @StateObject var timer: TimeCounter
    
//    init(tapCount: Binding<Int>, color: Color) {
//        _tapCount = tapCount
//        self.color = color
//    }
    
    var body: some View {
        Button(action: {
            timer.startTimer()
        }) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 4)
        )
    }
}

#Preview {
    ContentView()
        .environmentObject(UserManager())
}
