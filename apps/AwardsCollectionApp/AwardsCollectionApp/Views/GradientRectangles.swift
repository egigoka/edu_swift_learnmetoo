//
//  GradientRectangles.swift
//  AwardsCollectionApp
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct GradientRectangles: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
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
                    .frame(width: width, height: height)
                    .rotationEffect(.degrees(Double(iteration) * 60))
            }
            
            Image(systemName: "airplane")
                .resizable()
        }
    }
}

#Preview {
    GradientRectangles(width: 200, height: 200)
}
