//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by egigoka2kz on 19.07.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue
            Text("Hello, SwiftUI!")
                .font(.title)
        }
    }
}

#Preview {
    ContentView()
}

#Preview(traits: .landscapeLeft) {
    ContentView()
}
