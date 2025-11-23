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
    
    var body: some View {
        ZStack {
            Image("swiftimage256x256")
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
            .fill()
            .stroke(.black, lineWidth: 2)
        }
        .frame(width: width, height: height)
    }
    
    private func point(x: CGFloat, y: CGFloat) -> CGPoint {
        print(1/256*width)
        return CGPoint(x: x / 256 * width, y: y / 256 * height)
    }
}


#Preview {
    SwiftView(width: 256, height: 256)
}

