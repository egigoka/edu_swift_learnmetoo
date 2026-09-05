//
//  ContentView.swift
//  ShapeApp
//
//  Created by egigoka2kz on 05.09.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("swift")
                .resizable()
                .frame(width: 400, height: 400)
            Path { path in
                path.move(to: CGPoint(x: 250, y: 13))
                path.addQuadCurve(
                    to: CGPoint(x: 357, y: 260),
                    control: CGPoint(x: 390, y: 130)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 385, y: 350),
                    control: CGPoint(x: 390, y: 290)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 310, y: 320),
                    control: CGPoint(x: 350, y: 310)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 14, y: 238),
                    control: CGPoint(x: 185, y: 415)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 225, y: 260),
                    control: CGPoint(x: 110, y: 300)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 50, y: 70),
                    control: CGPoint(x: 115, y: 170)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 192, y: 179),
                    control: CGPoint(x: 115, y: 110)
                )
            }
            .stroke(lineWidth: 4)
            .frame(width: 400, height: 400)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
