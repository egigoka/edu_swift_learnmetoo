//
//  SwiftView.swift
//  AwardsCollectionApp
//
//  Created by egigoka on 23.11.2025.
//

import SwiftUI

struct SwiftView: View {
    let width: CGFloat
    let height: CGFloat
    
    // animation variables
    @State private var gradientShift: CGFloat = -0.5
    
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: point(x: 162, y: 10))
                path.addQuadCurve(to: point(x: 229, y: 166), control: point(x: 254, y: 86))
                path.addQuadCurve(to: point(x: 246, y: 223), control: point(x: 254, y: 191))
                path.addQuadCurve(to: point(x: 195, y: 209), control: point(x: 215, y: 194))
                path.addQuadCurve(to: point(x: 9, y: 151), control: point(x: 105, y: 262))
                path.addQuadCurve(to: point(x: 142, y: 166), control: point(x: 86, y: 195))
                path.addQuadCurve(to: point(x: 31, y: 43), control: point(x: 70, y: 102))
                path.addQuadCurve(to: point(x: 123, y: 114), control: point(x: 39, y: 55))
                path.addQuadCurve(to: point(x: 59, y: 30), control: point(x: 90, y: 78))
                path.addQuadCurve(to: point(x: 177, y: 125), control: point(x: 141, y: 102))
                path.addQuadCurve(to: point(x: 162, y: 10), control: point(x: 203, y: 78))
            }
            .fill(LinearGradient(
                colors: [.orange, .red],
                startPoint: UnitPoint(x: 0.25 + gradientShift, y: 0.25 + gradientShift),
                endPoint: UnitPoint(x: 0.75 + gradientShift , y: 0.75 + gradientShift)))
            .stroke(.orange, lineWidth: 2)
            .opacity(1)
        }
        .frame(width: width, height: height)
        .onAppear {
            withAnimation(
                Animation.linear(duration: 4)
                    .repeatForever(autoreverses: true)
            ) {
                gradientShift = 0.5
            }
        }
    }
    
    private func point(x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: x / 256 * width, y: y / 256 * height)
    }
}


#Preview {
    SwiftView(width: 256, height: 256)
}

