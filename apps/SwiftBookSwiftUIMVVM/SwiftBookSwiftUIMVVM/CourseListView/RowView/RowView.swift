//
//  RowView.swift
//  SwiftBookSwiftUIMVVM
//
//  Created by egigoka2kz on 20.09.2026.
//

import SwiftUI

struct RowView: View {
    let viewModel: RowViewViewModel
    
    var body: some View {
        HStack {
            CourseImage(imageData: viewModel.imageData,
                        imageSize: CGSize(width: 200, height: 100),
                        cornerRadius: 10,
                        shadowIsOn: false)
            Text(viewModel.courseName)
            Spacer()
        }
    }
}

#Preview {
    RowView(viewModel: RowViewViewModel(course: Course.getCourse()))
}
