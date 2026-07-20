//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by egigoka2kz on 19.07.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapCount = 0
    
    var body: some View {
        VStack{
            SwiftLogo()
                .padding(.bottom, -40)
            VStack(alignment: .leading) {
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
            GlassEffectContainer {
                Button("Tap Count: \(tapCount)", systemImage: "plus") {
                    tapCount += 1
                }
                .buttonStyle(.glass)
                .font(.title)
                
                Button(action: {
                    tapCount += 1
                } ) {
                    HStack {
                        Image(systemName: "plus")
                            .font(.title)
                        Text("Tap count: \(tapCount)")
                            .font(.title)
                    }
                }
                .buttonStyle(.glassProminent)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

#Preview(traits: .landscapeLeft) {
    ContentView()
}
