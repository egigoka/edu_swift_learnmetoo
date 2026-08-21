//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 20.08.2026.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
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
    
    var body: some View {
        Button {
            timer.startTimer()
        } label: {
            Text("Start")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.foreground, lineWidth: 4)
        )
    }
    /*
    init(tapCount: Binding<Int>, buttonColor: Color) {
        self._tapCount = tapCount
        self.buttonColor = buttonColor
    }
     */
}

#Preview {
    ContentView()
}
