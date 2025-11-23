//
//  PathView.swift
//  AwardsCollectionApp
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct PathView: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(height, width)
            let nearLine = size * 0.1
            let farLine = size * 0.9
            let middle = size / 2
            
            Path { path in
                path.move(to: CGPoint(x: middle + nearLine, y: nearLine))
                path.addLine(to: CGPoint(x: farLine, y: farLine))
                path.addLine(to: CGPoint(x: nearLine, y: farLine))
                path.addLine(to: CGPoint(x: middle - nearLine, y: nearLine))
            }
            .fill(Color(red: 0.4, green: 0.4, blue: 0.4))
            
            Path { path in
                path.move(to: CGPoint(x: middle, y: farLine))
                path.addLine(to: CGPoint(x: middle, y: nearLine))
            }
            .stroke(
                Color.white,
                style: StrokeStyle(lineWidth: 3,
                                   dash: [geometry.size.height / 20])
            )
            
            Image(systemName: "car.fill")
                .resizable()
                .foregroundStyle(Color.white)
                .scaleEffect(0.2)
                .offset(x: -geometry.size.width / 7.25)
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    PathView(width: 100, height: 100)
}
