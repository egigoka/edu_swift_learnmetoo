//
//  CustomGridView.swift
//  AwardsCollectionApp
//
//  Created by egigoka on 24.11.2025.
//

import SwiftUI

struct CustomGridView<Content>: View where Content: View {
    
    let items: [Int]
    let columns: Int
    let content: (Int) -> Content
    
    var rows: Int {
        guard columns > 0 else { return 0 }
        return Int(ceil(Double(items.count) / Double(columns)))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(Array(0..<rows), id: \.self) { rowIndex in
                    HStack {
                        ForEach(Array(0..<columns), id: \.self) { columnIndex in
                            if let index = indexFor(row: rowIndex, column: columnIndex) {
                                content(items[index])
                            } else {
                                Text("")
                                    .frame(width: 40)
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
    CustomGridView<Text>(items: [11, 3, 765, 18, 5, 34, 23, 45, 12, 7, 456], columns: 3) {item in
        Text("\(item)")
            .bold()
    }
}
