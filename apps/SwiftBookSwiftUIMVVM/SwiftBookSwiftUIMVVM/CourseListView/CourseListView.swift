//
//  ContentView.swift
//  SwiftBookSwiftUIMVVM
//
//  Created by egigoka2kz on 20.09.2026.
//

import SwiftUI

struct CourseListView: View {
    private var viewModel = CourseListViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                Text(viewModel.message)
            }
            .navigationTitle("Courses")
            .toolbar {
                ToolbarItem(placement: .topBarPinnedTrailing) {
                    Button {
                    } label: {
                        Label("Fetch data", systemImage: "arrow.clockwise")
                    }
                }
            }
        }
    }
}

#Preview {
    CourseListView()
}
