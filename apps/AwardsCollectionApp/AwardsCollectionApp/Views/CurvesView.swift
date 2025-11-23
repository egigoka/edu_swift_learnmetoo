//
//  CurvesView.swift
//  AwardsCollectionApp
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct CurvesView: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.height, geometry.size.width)
            let nearLine = size * 0.1
            let farLine = size * 0.9
            let middle = size / 2
            
            Path
        }
    }
}

#Preview {
    CurvesView(width: 200, height: 200)
}
