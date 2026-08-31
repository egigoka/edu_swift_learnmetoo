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
                    GradientRectangles(width: 200, height: 200)
                }
            }
            .navigationTitle("Shapes")
        }
    }
}

#Preview {
    ShapesView()
}
