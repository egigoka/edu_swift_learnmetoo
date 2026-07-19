//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by egigoka2kz on 19.07.2026.
//

import SwiftUI

struct ContentView: View {
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
