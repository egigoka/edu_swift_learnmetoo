//
//  DatePickerView.swift
//  SwiftUIiOS14
//
//  Created by egigoka2kz on 13.09.2026.
//

import SwiftUI

struct DatePickerView: View {
    @State private var date = Date()
    @State private var revealDate = false
    
    var body: some View {
        VStack {
            Text("Enter your birthday")
                .font(.largeTitle)
            
            DisclosureGroup(
                revealDate ? "Hide calendar" : "Show calendar",
                isExpanded: $revealDate
            ) {
                DatePicker("Enter your birthday", selection: $date)
                    .datePickerStyle(.graphical)
            }
            Spacer()
        }
    }
}

#Preview {
    DatePickerView()
}
