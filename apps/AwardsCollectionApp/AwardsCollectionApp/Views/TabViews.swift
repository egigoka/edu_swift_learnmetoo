//
//  TabViews.swift
//  AwardsCollectionApp
//
//  Created by egigoka2kz on 31.08.2026.
//

import SwiftUI

struct TabViews: View {
    var body: some View {
        TabView {
            SwiftView()
                .tabItem {
                    Label("Content View", systemImage: "rosette")
                }
            ShapesView()
                .tabItem {
                    Label("Shapes View", systemImage: "pencil.and.outline")
                }
            GridView()
                .tabItem {
                    Label("Grid View", systemImage: "square.grid.2x2")
                }
            CustomGridView(
                items: [1, 11, 15, 7, 48, 12, 1],
                columns: 3
            ) { item in
                Text("\(item)")
            }
                .tabItem {
                    Label("Custom Grid View", systemImage: "square.grid.2x2")
                }
        }
    }
}

#Preview {
    TabViews()
}
