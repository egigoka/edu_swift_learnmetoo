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
                Text(course.name)
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
