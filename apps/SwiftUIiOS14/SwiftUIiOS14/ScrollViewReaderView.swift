//
//  ScrollViewReaderView.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 13.09.2026.
//

import SwiftUI

struct ScrollViewReaderView: View {
    let colors = [Color.red, .green, .blue]
    
    var body: some View {
        ScrollView {
            ScrollViewReader { item in
                Button("Jump to the item 8") {
                    item.scrollTo(8)
                }
                
                ForEach(0..<10) { index in
                    ZStack {
                        Rectangle()
                            .foregroundStyle(colors[index % colors.count])
                        Text("Item \(index)")
                            .frame(width: 300, height: 300)
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderView()
}
