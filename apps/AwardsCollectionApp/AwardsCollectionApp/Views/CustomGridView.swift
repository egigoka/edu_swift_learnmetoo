//
//  CustomGridView.swift
//  AwardsCollectionApp
//
//  Created by egigoka2kz on 06.09.2026.
//

import SwiftUI

struct CustomGridView: View {
    
    let items: [Int]
    let columns: Int
    
    var rows: Int {
        items.count / columns + (items.count.isMultiple(of: columns) ? 0 : 1)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<rows) { rowIndex in
                    HStack {
                        ForEach(0..<columns) { columnIndex in
                            if let index = indexFor(row: rowIndex, column: columnIndex) {
                                Text("\(items[index])")
                            } else {
                                Text(" ")
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func indexFor(row: Int, column: Int) -> Int? {
        let index = row * columns + column
        return index < items.count ? index : nil
    }
}

#Preview {
    CustomGridView(items: [11, 3, 7, 17, 5, 2, 0], columns: 3)
}
