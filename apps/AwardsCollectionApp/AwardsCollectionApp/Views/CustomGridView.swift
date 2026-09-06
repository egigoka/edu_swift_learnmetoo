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
                            Text("\(items[rowIndex * columns + columnIndex]) ?? "")")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CustomGridView(items: [11, 3, 7, 17, 5, 2, 0], columns: 3)
}
