//
//  ContentView.swift
//  AwardsCollectionApp
//
//  Created by egigoka2kz on 31.08.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var showShape: Bool = false
    
    var body: some View {
        VStack {
            Button(action: { withAnimation { showShape.toggle() } } ) {
                HStack {
                    Text(showShape ? "Hide Shape" : "Show Shape")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .scaleEffect(showShape ? 2 : 1)
                        .rotationEffect(.degrees(showShape ? 0 : 180))
//                        .animation(.default)
                }
            }
            
            Spacer()
            
            if showShape {
                GradientRectangles(width: 250, height: 250)
                    .transition(.transition)
            }
//            GradientRectangles(width: 300, height: 300)
//                .offset(x: showShape ? 0 : -UIScreen.main.bounds.width)
//                .animation(.easeInOut)
//                .animation(.interpolatingSpring(
//                    mass: 1,
//                    stiffness: 100,
//                    damping: 10,
//                    initialVelocity: 0
//                ))
//                .animation(.spring(
//                    response: 0.55,
//                    dampingFraction: 0.45,
//                    blendDuration: 0
//                ))
//                .animation(.spring().delay(0.3).speed(3).repeatCount(2, autoreverses: false))
            
            Spacer()
        }
        .font(.headline)
        .padding()
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
