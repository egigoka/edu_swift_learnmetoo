//
//  CourseDetailsView.swift
//  SwiftBookSwiftUIMVVM
//
//  Created by egigoka2kz on 20.09.2026.
//

import SwiftUI

struct CourseDetailsView: View {
    var viewModel: CourseDetailsViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.courseName)
                .font(.largeTitle)
                .padding()
            Spacer()
        }
    }
}

#Preview {
    CourseDetailsView(
        viewModel: CourseDetailsViewModel(course: Course.getCourse())
    )
}
