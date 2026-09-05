//
//  ContentView.swift
//  AwardsCollectionApp
//
//  Created by egigoka2kz on 31.08.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var showShape: Bool = false
    
    var body: some View {
        VStack {
            Button(action: { showShape.toggle() } ) {
                HStack {
                    if showShape {
                        Text("Hide Shape")
                    } else {
                        Text("Show Shape")
                    }
                    Spacer()
                    Image(systemName: "chevron.up.square")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
