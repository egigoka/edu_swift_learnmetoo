//
//  CurvesView.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 05.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct CurvesView: View {
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let middle = size / 2
            let nearLine = size * 0.1
            let farLine = size * 0.9
            
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: middle, y: nearLine))
                    path.addQuadCurve(
                        to: CGPoint(x: farLine, y: middle),
                        control: CGPoint(x: size, y: 0)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: middle, y: farLine),
                        control: CGPoint(x: size, y: size)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: nearLine, y: middle),
                        control: CGPoint(x: 0, y: size)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: middle, y: nearLine),
                        control: CGPoint(x: 0, y: 0)
                    )
                }
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [.white, .yellow]),
                        center: .center,
                        startRadius: geometry.size.width * 0.05,
                        endRadius: geometry.size.width * 0.6
                    )
                )
                
                Path { path in
                    path.addArc(
                        center: CGPoint(x: nearLine, y: nearLine),
                        radius: middle,
                        startAngle: .degrees(90),
                        endAngle: .degrees(0),
                        clockwise: true
                    )
                    path.addArc(
                        center: CGPoint(x: farLine, y: nearLine),
                        radius: middle,
                        startAngle: .degrees(180),
                        endAngle: .degrees(90),
                        clockwise: true
                    )
                    path.addArc(
                        center: CGPoint(x: farLine, y: farLine),
                        radius: middle,
                        startAngle: .degrees(270),
                        endAngle: .degrees(180),
                        clockwise: true
                    )
                    path.addArc(
                        center: CGPoint(x: nearLine, y: farLine),
                        radius: middle,
                        startAngle: .degrees(0),
                        endAngle: .degrees(270),
                        clockwise: true
                    )
                }
                .stroke(Color.orange, lineWidth: 2)
            }
        }
        .frame(width: width, height: height)
    }
}

struct CurvesView_Previews: PreviewProvider {
    static var previews: some View {
        CurvesView(width: 200, height: 200)
    }
}
