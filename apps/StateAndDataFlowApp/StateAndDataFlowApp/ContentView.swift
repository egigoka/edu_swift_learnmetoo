//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka on 12.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    
    var body: some View {
        VStack {
            Text("\(tapCount)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Spacer()
            ButtonView(tapCount: $tapCount, color: .black)
            Spacer()
        }
        .padding()
    }
}

struct ButtonView: View {
    @Binding var tapCount: Int
    
    let color: Color
    
//    init(tapCount: Binding<Int>, color: Color) {
//        _tapCount = tapCount
//        self.color = color
//    }
    
    var body: some View {
        Button(action: {
            tapCount += 1
        }) {
            Text("Tap me")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 4)
        )
    }
}

#Preview {
    ContentView()
}
