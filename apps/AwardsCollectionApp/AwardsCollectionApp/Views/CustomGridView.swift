//
//  CustomGridView.swift
//  AwardsCollectionApp
//
//  Created by egigoka on 24.11.2025.
//

import SwiftUI

struct CustomGridView: View {
    
    let items: [Int]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<items.count) { index in
                    Text("\(items[index])")
                }
            }
        }
    }
}

#Preview {
    CustomGridView(items: [11, 3, 7, 18, 5, 2])
}
