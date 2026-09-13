//
//  ContentView.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 07.09.2026.
//

import SwiftUI

private enum AppTab: Hashable {
    case document
    case stacks
    case webLinks
    case home
    case editor
    case map
    case page
}

struct ContentView: View {
    @EnvironmentObject var model: DataModel
    @Binding var document: TextFile
    @State private var selectedTab = AppTab.document
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Document Editor", systemImage: "doc.text", value: AppTab.document) {
                DocumentBase(document: $document)
            }
            Tab("Stacks", systemImage: "square.stack", value: AppTab.stacks) {
                LazyStacks()
            }
            Tab("Web Links", systemImage: "globe", value: AppTab.webLinks) {
                WebLinks()
            }
            Tab("Home", systemImage: "house", value: AppTab.home) {
                Text(model.title)
                    .padding()
            }
            Tab("Editor", systemImage: "pencil", value: AppTab.editor) {
                TextEditorView()
            }
            Tab("Map", systemImage: "map", value: AppTab.map) {
                MapView()
            }
            Tab("Page", systemImage: "book", value: AppTab.page) {
                PageView()
            }
        }
    }
}

#Preview {
    ContentView(document: .constant(TextFile()))
        .environmentObject(DataModel())
}
