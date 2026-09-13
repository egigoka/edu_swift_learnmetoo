//
//  ToolBarItems.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 13.09.2026.
//

import SwiftUI

struct ToolBarItems: View {
    var body: some View {
        NavigationView {
            Text("Hello world!")
                .padding()
                .navigationTitle("SwiftUI")
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        HStack {
                            Button("Button One") {
                                
                            }
                            Button("Button 2") { }
                            Button("Button 3") { }
                        }
                    }
                }
        }
    }
}

#Preview {
    ToolBarItems()
}
