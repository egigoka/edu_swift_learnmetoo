//
//  CurvesView.swift
//  AwardsCollectionApp
//
//  Created by egigoka2kz on 05.09.2026.
//

import SwiftUI

struct CurvesView: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let nearline = size * 0.1
            let farline = size * 0.9
            let middle = size * 0.5
            
            Path { path in
                path.move(to: CGPoint(x: middle, y: nearline))
                path.addQuadCurve(
                    to: CGPoint(x: farline, y: middle),
                    control: CGPoint(x: size, y: 0)
                )
                path.addQuadCurve(
                    to: CGPoint,(x: middle, y: farline)
                    control: CGPoint(x: size, y: size)
                )
                path.addQuadCurve(
                    to: CGPoint(x: nearline, y: middle),
                    control: CGPoint(x: 0, y: size)
                )
                path.addQuadCurve(
                    to: CGPoint(x: middle, y: nearline,
                                control: CGPoint
                )
                
            }
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    CurvesView(width: 200, height: 200)
}
