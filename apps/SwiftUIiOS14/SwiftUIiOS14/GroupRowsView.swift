//
//  GroupRowsView.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 13.09.2026.
//

import SwiftUI

struct GroupRowsView: View {
    var body: some View {
        List(0..<100) { rowIndex in
            Text("Row index: \(rowIndex)")
        }
        .listStyle(InsetGroupedListStyle())
    }
}

#Preview {
    GroupRowsView()
}
