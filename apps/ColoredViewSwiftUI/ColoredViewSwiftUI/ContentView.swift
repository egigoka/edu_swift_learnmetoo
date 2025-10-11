//
//  ContentView.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 11.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State var value: Double
    @State var inputValue: String
    @State var alertPresent: Bool
    
    var body: some View {
        
        VStack {
            HStack {
                Slider(value: $value, in: 0...255, step: 1) {
                    EmptyView()
                } minimumValueLabel: {
                    Text("\(Int(value))")
                        .monospacedDigit()
                } maximumValueLabel: {
                    Text("")
                }
                .onChange(of: value) { _, newValue in
                    inputValue = "\(Int(value))"
                }
                TextField("", text: $inputValue)
                    .onSubmit {
                        if let inputValue = Double(inputValue)
                        {
                            value = inputValue
                        } else {
                            inputValue = ""
                            alertPresent = true
                        }
                    }
            }
            .padding()
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
    ContentView(value: 100, inputValue: "test", alertPresent: false)
}
