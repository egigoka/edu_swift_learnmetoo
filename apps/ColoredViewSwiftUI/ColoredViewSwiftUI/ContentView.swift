//
//  ContentView.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka2kz on 12.08.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red: Double = Double(Int.random(in: 0...255))
    @State private var green: Double = Double(Int.random(in: 0...255))
    @State private var blue: Double = Double(Int.random(in: 0...255))
    
    var body: some View {
        VStack {
            ColoredView(red: red, green: green, blue: blue)
            ColorSlider(value: $red, color: .red)
            ColorSlider(value: $green, color: .green)
            ColorSlider(value: $blue, color: .blue)
        }
        .padding()
        .onTapGesture {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
        }
    }
}

#Preview {
    ContentView()
}
