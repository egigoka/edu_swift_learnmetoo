//
//  HorizontalGridView.swift
//  AwardsCollectionApp
//
//  Created by egigoka2kz on 06.09.2026.
//

import SwiftUI

struct HorizontalGridView: View {
    let data = 1...10
    
    let rows = [GridItem(.fixed(200))]
    
    var body: some View {
        ScrollView {
            LazyHGrid(rows: rows, alignment: .center) {
                ForEach(data, id: \.self) { item in
                    Text("Image \(item)")
                }
            }
        }
    }
}

#Preview {
    HorizontalGridView()
}
