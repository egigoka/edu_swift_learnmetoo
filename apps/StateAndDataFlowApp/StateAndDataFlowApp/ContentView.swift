//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 20.08.2026.
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
    
    var body: some View {
        Button {
            
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
