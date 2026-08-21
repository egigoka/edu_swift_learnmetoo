//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by egigoka2kz on 20.08.2026.
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
            ButtonView(tapCount: $tapCount, buttonColor: .red)
            Spacer()
        }
        .padding()
    }
}

struct ButtonView: View {
    
    @Binding var tapCount: Int
    
    let buttonColor: Color
    
    var body: some View {
        Button("Tap me!") {
            tapCount += 1
        }
        Button {
            tapCount += 1
        } label: {
            Text
        }

    }
}

#Preview {
    ContentView()
}
