//
//  VerticalGridView.swift
//  AwardsCollectionApp
//
//  Created by egigoka2kz on 06.09.2026.
//

import SwiftUI

struct VerticalGridView: View {
    let data = (1...100).map { "Item \($0)" }
    //let columns = [GridItem(.adaptive(minimum: 80))]
    let columns = [
        GridItem(.fixed(70)),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}

#Preview {
    VerticalGridView()
}
