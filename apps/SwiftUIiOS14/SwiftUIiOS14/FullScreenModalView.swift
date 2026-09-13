//
//  FullScreenModalView.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 13.09.2026.
//

import SwiftUI

struct MainView: View {
    @State private var isPresented = false
    
    var body: some View {
        Button("Go to modal view") {
            isPresented.toggle()
        }
        .fullScreenCover(isPresented: $isPresented) {
            FullScreenModalView()
        }
    }
}

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("This is a modal view")
            Text("Please tap to dismiss")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundStyle(.red)
        .ignoresSafeArea()
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    MainView()
}
