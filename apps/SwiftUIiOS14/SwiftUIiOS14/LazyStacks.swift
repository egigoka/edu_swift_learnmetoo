//
//  LazyStacks.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 13.09.2026.
//

import SwiftUI

struct LazyStacks: View {
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(1...100, id: \.self, content: SampleRow.init)
                }
            }
        }
        .padding()
    }
}

struct SampleRow: View {
    let id: Int
    var body: some View {
        Text("Row \(id)")
    }
    
    init(id: Int) {
        print("Row number \(id)")
        self.id = id
    }
}

