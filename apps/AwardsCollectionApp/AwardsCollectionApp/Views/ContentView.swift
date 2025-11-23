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
    
    var body: some View {
        GeometryReader{ geometry in
            let fullWidth = geometry.size.width
            + geometry.safeAreaInsets.leading
            + geometry.safeAreaInsets.trailing
            VStack {
                Button(action: { showShape.toggle() }) {
                    HStack {
                        Text(showShape ? "Hide Shape" : "Show Shape")
                        Spacer()
                        Image(systemName: "chevron.up.square")
                            .rotationEffect(.degrees(showShape ? 0 : 180))
                            .animation(.default, value: showShape)
                    }
                }
                
                Spacer()
                
                GradientRectangles(width: shapeSize, height: shapeSize)
                    .offset( x: showShape ? 0 : -(fullWidth + shapeSize) / 2)
                    .animation(.easeOut, value: showShape)
                
                Spacer()
            }
            .font(.headline)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
