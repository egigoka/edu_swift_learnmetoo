//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka on 12.10.2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("3")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Spacer()
            ButtonView()
            Spacer()
        }
        .padding()
    }
}

struct ButtonView: View {
//    init(tapCount: Binding<Int>, color: Color) {
//        _tapCount = tapCount
//        self.color = color
//    }
    
    var body: some View {
        Button(action: {
            
        }) {
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
                .stroke(Color.blue, lineWidth: 4)
        )
    }
}

#Preview {
    ContentView()
}
