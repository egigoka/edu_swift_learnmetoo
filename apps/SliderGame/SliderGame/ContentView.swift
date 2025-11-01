//
//  ContentView.swift
//  SliderGame
//
//  Created by egigoka on 02.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State private 
    
    var targetValue: Int
    
    
    init() {
        targetValue = Int.random(in: 0...100)
    }
    
    var body: some View {
        VStack {
            Text("Get as close to the value: \(targetValue)")
            Button("Check me!") {
                
            }
            Button("Restart") {
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
