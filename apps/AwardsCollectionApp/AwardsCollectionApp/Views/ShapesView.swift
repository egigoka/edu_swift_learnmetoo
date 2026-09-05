//
//  ShapesView.swift
//  AwardsCollectionApp
//
//  Created by egigoka2kz on 31.08.2026.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    GradientRectangles(width: 250, height: 250)
                    PathView(width: 250, height: 250)
                    CurvesView(width: 250, height: 250)
                }
            }
            .navigationTitle("Shapes")
        }
    }
}

#Preview {
    ShapesView()
}
