//
//  ContentView.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 11.10.2025.
//

import SwiftUI

struct ContentView: View {
    @FocusState var isFocused: Bool
    @State var value: Double
    @State var alertPresent: Bool
    @State var red: Double
    @State var green: Double
    @State var blue: Double
    
    var body: some View {
        
        ZStack {
            VStack {
                ColoredView(red: red, green: green, blue: blue)
                    .padding(.horizontal)
                ColorSlider(value: $red, color: .red) { alertPresent = true }
                    .padding(.vertical)
                ColorSlider(value: $green, color: .green) { alertPresent = true }
                    .padding(.vertical)
                ColorSlider(value: $blue, color: .blue) { alertPresent = true }
                    .padding(.vertical)
//                    .padding(.bottom, true ? 60 : 0)
                    .padding(.bottom, isFocused ? 70 : 0)
            }
//            if true {
            if isFocused {
                HStack{
                    Spacer()
                    VStack{
                        Spacer()
                        Button("Done") {
                            isFocused = false
                        }
                        .buttonStyle(.glassProminent)
                        .padding(16)
                    }
                }
            }
        }
        .focused($isFocused)
        .padding()
        .alert(isPresented: $alertPresent) {
            Alert(
                title: Text("Wrong value"),
                message: Text("Please, input a number between 0 and 255"),
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
