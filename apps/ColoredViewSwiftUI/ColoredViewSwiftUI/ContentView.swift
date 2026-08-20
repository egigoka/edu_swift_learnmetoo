//
//  ContentView.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka2kz on 12.08.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State var red: Double = Double(Int.random(in: 0...255))
    @State var green: Double = Double(Int.random(in: 0...255))
    @State var blue: Double = Double(Int.random(in: 0...255))
    
    var body: some View {
        VStack {
            ColoredView(red: red, green: green, blue: blue)
            ColorSlider(color: .red, value: $red)
            ColorSlider(color: .green, value: $green)
            ColorSlider(color: .blue, value: $blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
