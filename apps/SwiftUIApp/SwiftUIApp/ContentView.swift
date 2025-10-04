//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by egigoka on 28.09.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Part 2")
                .font(.title)
            HStack {
                Text("Introducing Stacks and Containers")
                    .font(.subheadline)
                Spacer()
                Text("SwiftUI")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
