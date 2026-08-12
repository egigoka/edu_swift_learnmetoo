//
//  ContentView.swift
//  Lesson2
//
//  Created by egigoka2kz on 21.07.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Double.random(in: 0...255)
    @State private var userName = ""
    @State private var displayedName = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 40) {
            Text("\(lround(sliderValue))")
                .font(.largeTitle)
            UserNameView(userName: displayedName)
            ColoredSlider(value: $sliderValue, textColor: .red)
            TextField("Enter your name", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Done", action: checkUsername)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Wrong format"),
                        message: Text("Enter your name"),
                    )
                }
            VStack {
                Text("Welcome to")
                    .font(.system(size: 60))
                    .bold()
                    //.foregroundStyle(.red)
                    //.background(.blue)
                    //.padding()
                    //.background(.red)
                    //.lineLimit(2)
                    //.multilineTextAlignment(.leading)
                Text("SwiftUI")
                    .font(.system(size: 60))
                    .bold()
            }
            .foregroundStyle(.red)
            
            Spacer()
        }
        .padding()
    }
    
    private func checkUsername() {
        if let _ = Double(userName) {
            userName = ""
            showAlert = true
            return
        }
        displayedName = userName
        userName = ""
    }
}

#Preview {
    ContentView()
}
