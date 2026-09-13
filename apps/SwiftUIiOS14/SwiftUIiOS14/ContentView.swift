//
//  ContentView.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 07.09.2026.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: DataModel
    
    var body: some View {
        TabView {
            LazyStacks()
                .tabItem {
                    Label("Stacks", systemImage: "square.stack")
                }
            VStack {
                Text(model.title)
            }
            .padding()
            .tabItem {
                Label("Home", systemImage: "house")
            }
            TextEditorView()
                .tabItem {
                    Label("Editor", systemImage: "pencil")
                }
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            PageView()
                .tabItem {
                    Label("Page", systemImage: "book")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(DataModel())
}
