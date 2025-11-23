//
//  ContentView.swift
//  AwardsCollectionApp
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showShape = false
    private let shapeSize: CGFloat = 250
    @State private var screenWidth: CGFloat = 0
    
    var body: some View {
        GeometryReader{ geometry in
            let _ = self.screenWidth = geometry.size.width
            let _ = print(self.screenWidth)
            Circle()
        }
        .ignoresSafeArea()
        VStack {
            Button(action: { showShape.toggle() }) {
                HStack {
                    Text(showShape ? "Hide Shape" : "Show Shape")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .rotationEffect(.degrees(showShape ? 0 : 180))
                        .animation(.default, value: 0.2)
                }
            }
            
            Spacer()
            
            GradientRectangles(width: shapeSize, height: shapeSize)
                .offset(
                    x: showShape ? 0 : -UIScreen.main.bounds.width / 2 - shapeSize / 2
                )
                .offset(x: showShape ? 0 : CGFloat(screenWidth / 2) + shapeSize / 2)
                .animation(.default, value: 0.2)
            
            
            Spacer()
        }
        .font(.headline)
        .padding()
    }
}

#Preview {
    ContentView()
}
