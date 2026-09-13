//
//  DateView.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 13.09.2026.
//

import SwiftUI

struct DateView: View {
    var body: some View {
        Text(Date()...Date().addingTimeInterval(600))
        Text(Date().addingTimeInterval(600), style: .date)
        Text(Date().addingTimeInterval(600), style: .relative)
        Text(Date().addingTimeInterval(600), style: .timer)
        
        
    }
}

#Preview {
    DateView()
}
