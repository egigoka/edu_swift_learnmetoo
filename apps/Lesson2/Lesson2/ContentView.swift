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
                .bordered()
                
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

extension View {
    func bordered() -> some View {
        ModifiedContent(content: self, modifier: BorderedViewModifier())
    }
}

struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(
            EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.blue)
            )
            .shadow(color: .gray.opacity(0.4), radius: 3, x: 1, y: 2)
    }
}


#Preview {
    ContentView()
}
