//
//  ContentView.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 11.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State var value: Double
    @State var alertPresent: Bool
    @State var red: Double
    @State var green: Double
    @State var blue: Double
    
    var body: some View {
        
        VStack {
            ColoredView(red: red, green: green, blue: blue)
            ColorSlider(value: $red, color: .red) {
                alertPresent = true
            }
            ColorSlider(value: $green, color: .green) {
                alertPresent = true
            }
            ColorSlider(value: $blue, color: .blue) {
                alertPresent = true
            }
        }
        .padding()
        .alert(isPresented: $alertPresent) {
            Alert(
                title: Text("Wrong value"),
                message: Text("Please, input a number"),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
}

#Preview {
    ContentView(
        value: 100,
        alertPresent: false,
        red: 100,
        green: 200,
        blue: 150)
}
