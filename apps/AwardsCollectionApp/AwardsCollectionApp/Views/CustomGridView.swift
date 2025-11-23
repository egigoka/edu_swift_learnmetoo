//
//  CustomGridView.swift
//  AwardsCollectionApp
//
//  Created by egigoka on 24.11.2025.
//

import SwiftUI

struct CustomGridView: View {
    
    let items: [Int]
    let columns: Int
    
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
                            let index = rowIndex * columns + columnIndex
                            if index < items.count {
                                Text("\(items[index])")
                                    .frame(width: 40)
                            } else {
                                Text(" ")
                                    .frame(width: 40)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CustomGridView(items: [11, 3, 7, 18, 5, 34, 23, 45, 12, 7, 456], columns: 3)
}
