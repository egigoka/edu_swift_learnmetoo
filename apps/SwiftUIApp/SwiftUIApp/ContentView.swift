//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by egigoka on 28.09.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapCountFirstButton = 0
    @State private var tapCountSecondButton = 0
    
    var body: some View {
        VStack {
            SwiftLogo()
                .padding(.bottom, -64)
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
            Spacer()
            Button("Tap count: \(tapCountFirstButton)") {
                print("First button tapped")
                tapCountFirstButton += 1
            }
            .font(.title)
            .buttonStyle(.borderedProminent)
            .buttonSizing(.flexible)
            .padding()
            Button(action: secondButtonTapped) {
                Text("Tap count: \(tapCountSecondButton)")
                    .font(.title)
            }
            .buttonStyle(.borderedProminent)
            .buttonSizing(.flexible)
            .padding()
            

        }
        .padding()
    }
    
    private func secondButtonTapped() {
        print("Second button tapped")
        tapCountSecondButton += 1
    }
}

#Preview {
    ContentView()
}
