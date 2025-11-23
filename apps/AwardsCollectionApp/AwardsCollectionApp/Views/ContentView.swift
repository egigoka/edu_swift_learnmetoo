//
//  ContentView.swift
//  AwardsCollectionApp
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showShape = false
    
    var body: some View {
        VStack {
            Button(action: { showShape.toggle() }) {
                HStack {
                    Text(showShape ? "Hide Shape" : "Show Shape")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .rotationEffect(.degrees(showShape ? 0 : 180))
                        .animation(.default, value: 0.2)
                }
            }
            
            Spacer()
            
            
        }
        .font(.headline)
        .padding()
    }
}

#Preview {
    ContentView()
}
