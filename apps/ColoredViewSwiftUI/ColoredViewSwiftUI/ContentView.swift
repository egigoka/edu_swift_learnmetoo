//
//  ContentView.swift
//  ColoredViewSwiftUI
//
//  Created by egigoka on 11.10.2025.
//

import SwiftUI

struct ContentView: View {
    @FocusState var isFocused: Bool
    @State var red: Double
    @State var green: Double
    @State var blue: Double
    
    var body: some View {
        ZStack {
            VStack {
                ColoredView(red: red, green: green, blue: blue)
                    .padding(.horizontal)
                ColorSlider(value: $red, color: .red)
                    .padding(.vertical)
                ColorSlider(value: $green, color: .green)
                    .padding(.vertical)
                ColorSlider(value: $blue, color: .blue)
                    .padding(.vertical)
                //  .padding(.bottom, true ? 60 : 0) // for preview
                    .padding(.bottom, isFocused ? 70 : 0)
            }
            .animation(.easeInOut(duration: 2), value: isFocused)
            ZStack {
                // if true { // for preview
                //if isFocused {
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Button("Done") {
                                withAnimation(.easeInOut(duration: 2)) {
                                    isFocused = false
                                }
                            }
                            .buttonStyle(.glassProminent)
                            .padding(16)
                        }
                    }
                    .opacity(isFocused ? 1 : 0)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                //}
            }
            .animation(.easeInOut(duration: 2), value: isFocused)
        }
        .focused($isFocused)
        .padding()
        .onChange(of: isFocused) { oldValue, newValue in
            if newValue {
                withAnimation(.easeInOut(duration: 2)) {
                    // for button appearing animation
                }
            }
        }
    }
}

#Preview {
    ContentView(
        red: 100,
        green: 200,
        blue: 150)
}
