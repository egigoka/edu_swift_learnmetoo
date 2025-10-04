//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by egigoka on 28.09.2025.
//

import SwiftUI

struct ContentView: View {
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
            Button("Tap count: 0") {
                
            }
            .buttonStyle(.borderedProminent)
            .buttonSizing(.flexible)
            .padding()
            Button(action: secondButtonTapped) {
                Text("Tap count: 0")
            }
            .buttonStyle(.borderedProminent)
            .buttonSizing(.flexible)
            .padding()
            

        }
        .padding()
    }
    
    private func secondButtonTapped() {
        
    }
}

#Preview {
    ContentView()
}
