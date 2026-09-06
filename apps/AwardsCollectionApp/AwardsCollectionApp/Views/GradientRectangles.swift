//
//  GradientRectangles.swift
//  AwardsCollectionApp
//
//  Created by egigoka2kz on 31.08.2026.
//

import SwiftUI

struct GradientRectangles: View {
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<3) { iteration in
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.green, .blue]),
                                startPoint: UnitPoint(x: 0, y: 1),
                                endPoint: UnitPoint(x: 1, y: 0)
                            )
                        )
                        .frame(
                            width: geometry.size.width * 0.7,
                            height: geometry.size.height * 0.7
                        )
                        .rotationEffect(.degrees(Double(iteration) * 60))
                }
                Image(systemName: "airplane")
                    .resizable()
                    .rotationEffect(.degrees(-90))
                    .opacity(0.5)
                    .scaleEffect(0.7)
            }
        }
    }
}

#Preview {
    GradientRectangles()
        .frame(width: 200, height: 200)
}
