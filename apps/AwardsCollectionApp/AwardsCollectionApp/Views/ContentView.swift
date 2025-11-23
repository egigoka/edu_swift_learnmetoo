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
//            let fullWidth = geometry.size.width
//            + geometry.safeAreaInsets.leading
//            + geometry.safeAreaInsets.trailing
            VStack {
                Button(action: { withAnimation { showShape.toggle() } }) {
                    HStack {
                        Text(showShape ? "Hide Shape" : "Show Shape")
                        Spacer()
                        Image(systemName: "chevron.up.square")
                            .scaleEffect(showShape ? 2 : 1)
                            .rotationEffect(.degrees(showShape ? 0 : 180))
                    }
                }
                
                Spacer()
                if showShape {
                    GradientRectangles(width: shapeSize, height: shapeSize)
                        .animation(.default, value: showShape)
                        .transition(.transition)
                    //.offset( x: showShape ? 0 : -(fullWidth + shapeSize) / 2)
                    //.animation(.easeOut, value: showShape)
                }
                
                Spacer()
            }
            .font(.headline)
            .padding()
        }
    }
}

extension AnyTransition {
    static var transition: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .scale)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

#Preview {
    ContentView()
}
