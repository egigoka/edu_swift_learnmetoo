//
//  CustomGridView.swift
//  AwardsCollectionApp
//
//  Created by egigoka2kz on 06.09.2026.
//

import SwiftUI

struct CustomGridView<Content, T>: View where Content: View {
    
    let items: [T]
    let columns: Int
    let content: (T) -> Content
    
    var rows: Int {
        items.count / columns + (items.count.isMultiple(of: columns) ? 0 : 1)
    }
    
    var body: some View {
        GeometryReader { geometry in
            let sideSize = geometry.size.width / CGFloat(columns)
            ScrollView {
                VStack {
                    ForEach(0..<rows) { rowIndex in
                        HStack {
                            ForEach(0..<columns) { columnIndex in
                                if let index = indexFor(row: rowIndex, column: columnIndex) {
                                    content(items[index])
                                        .frame(width: sideSize, height: sideSize)
                                } else {
                                    Spacer()
                                }
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
    CustomGridView(items: [11, 3, 7, 17, 5, 2, 0], columns: 3) { item in
        Text("\(item)")
    }
}
