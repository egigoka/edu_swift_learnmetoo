//
//  ContentView.swift
//  SwiftBookSwiftUIMVVM
//
//  Created by egigoka2kz on 20.09.2026.
//

import SwiftUI

struct CourseListView: View {
    @StateObject private var viewModel = CourseListViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.courses, id: \.name) { course in
                NavigationLink(
                    destination: CourseDetailsView(
                        viewModel: CourseDetailsViewModel(course: course)
                    )
                ) {
                    RowView(viewModel: RowViewViewModel(course: course))
                }
            }
            .navigationTitle("Courses")
        }
        .onAppear {
            viewModel.fetchCourses()
        }
    }
}

#Preview {
    CourseListView()
}
