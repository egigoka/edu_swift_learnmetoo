//
//  ContentView.swift
//  HelloWorld
//
//  Created by egigoka on 28.09.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image("swiftimage50x50")
            
            VStack {
                Text("Hello, world!")
                Text("This is SwiftUI View")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
