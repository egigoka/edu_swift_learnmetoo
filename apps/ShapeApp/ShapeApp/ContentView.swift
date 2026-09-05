//
//  ContentView.swift
//  ShapeApp
//
//  Created by egigoka2kz on 05.09.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("swift")
            Path { path in
                
            }
            .frame(width: 400, height: 400)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
