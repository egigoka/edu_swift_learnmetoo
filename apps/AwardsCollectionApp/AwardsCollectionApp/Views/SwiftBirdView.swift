//
//  ContentView.swift
//  ShapeApp
//
//  Created by egigoka2kz on 05.09.2026.
//

import SwiftUI

struct SwiftBirdView: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        ZStack {
            Image("swift")
                .resizable()
                .frame(width: width, height: height)
            Path { path in
                path.move(to: CGPoint(x: 250/400*width, y: 13/400*height))
                path.addQuadCurve(
                    to: CGPoint(x: 357/400*width, y: 260/400*height),
                    control: CGPoint(x: 390/400*width, y: 130/400*height)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 385/400*width, y: 350/400*height),
                    control: CGPoint(x: 390/400*width, y: 290/400*height)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 310/400*width, y: 320/400*height),
                    control: CGPoint(x: 350/400*width, y: 310/400*height)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 14/400*width, y: 238/400*height),
                    control: CGPoint(x: 185/400*width, y: 415/400*height)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 225/400*width, y: 260/400*height),
                    control: CGPoint(x: 110/400*width, y: 300/400*height)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 50/400*width, y: 70/400*height),
                    control: CGPoint(x: 115/400*width, y: 170/400*height)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 192/400*width, y: 179/400*height),
                    control: CGPoint(x: 110/400*width, y: 120/400*height)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 92/400*width, y: 48/400*height),
                    control: CGPoint(x: 130/400*width, y: 110/400*height)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 278/400*width, y: 195/400*height),
                    control: CGPoint(x: 155/400*width, y: 110/400*height)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 250/400*width, y: 13/400*height),
                    control: CGPoint(x: 310/400*width, y: 110/400*height)
                )
                path.closeSubpath()
            }
            .stroke(lineWidth: 4)
            .frame(width: width, height: height)
        }
        .padding()
    }
}

#Preview {
    SwiftBirdView(width: 250, height: 250)
}
