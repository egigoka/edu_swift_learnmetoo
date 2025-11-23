//
//  TabViews.swift
//  AwardsCollectionApp
//
//  Created by egigoka on 09.11.2025.
//

import SwiftUI

struct TabViews: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "rosette")
                    Text("Content View")
                }
            ShapesView()
                .tabItem {
                    Image(systemName: "pencil.and.outline")
                    Text("Shapes View")
                }
        }
    }
}

#Preview {
    TabViews()
}
