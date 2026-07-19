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
            VStack {
                Text("Hello, SwiftUI!")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

#Preview(
    traits:
        .fixedLayout(width: 667, height: 375),
        .landscapeLeft
        
) {
    ContentView()
}
