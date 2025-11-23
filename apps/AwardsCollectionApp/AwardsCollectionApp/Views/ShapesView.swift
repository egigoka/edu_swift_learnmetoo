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
                    GradientRectangles(width: 250, height: 250)
                    PathView(width: 250, height: 250)
                    CurvesView(width: 250, height: 250)
                    SwiftView(width: 250, height: 250)
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
