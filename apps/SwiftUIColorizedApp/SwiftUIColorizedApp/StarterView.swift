//
//  StarterView.swift
//  SwiftUIColorizedApp
//
//  Created by egigoka on 27.10.2025.
//  Copyright © 2025 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct StarterView: View {
    @State private var showSwiftUIView = false
    @State private var showUIKitView = false
    
    var body: some View {
        VStack {
            Button("Show SwiftUI view") {
                showSwiftUIView = true
            }
            .sheet(isPresented: $showSwiftUIView) {
                ContentView()
            }
        }
    }
}

#Preview {
    StarterView()
}
