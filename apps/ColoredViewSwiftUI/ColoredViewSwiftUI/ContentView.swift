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
