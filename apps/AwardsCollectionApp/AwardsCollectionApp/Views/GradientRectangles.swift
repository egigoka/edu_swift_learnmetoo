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
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color.red, Color.blue]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .frame(width: width, height: height)
    }
}

#Preview {
    GradientRectangles(width: 200, height: 200)
}
