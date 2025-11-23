//
//  ShapesView.swift
//  AwardsCollectionApp
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    GradientRectangles(width: 125, height: 125)
                    PathView(width: 125, height: 125)
                    CurvesView(width: 125, height: 125)
                    SwiftView(width: 125, height: 125)
                    HypocycloidView(width: 125, height: 125)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationTitle("Shapes")
        }
    }
}

#Preview {
    ShapesView()
}
