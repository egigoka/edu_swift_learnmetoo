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
            ContentView()
                .tabItem {
                    Label("Content View", systemImage: "rosette")
                }
            ShapesView()
                .tabItem {
                    Label("Shapes View", systemImage: "pencil.and.outline")
                }
        }
    }
}

#Preview {
    TabViews()
}
