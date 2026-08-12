//
//  ContentView.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka2kz on 12.08.2026.
//

import SwiftUI

struct ContentView: View {
    
    let red: Double = 0
    let green: Double = 0
    let blue: Double = 0
    
    var body: some View {
        VStack {
            ColoredView(color: Color(red: red, green: green, blue: blue))
//            ColorSlider()
//            ColorSlider()
//            ColorSlider()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
