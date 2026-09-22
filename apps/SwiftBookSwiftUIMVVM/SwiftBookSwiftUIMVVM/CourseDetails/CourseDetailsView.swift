//
//  CourseDetailsView.swift
//  SwiftBookSwiftUIMVVM
//
//  Created by egigoka2kz on 20.09.2026.
//

import SwiftUI

struct CourseDetailsView: View {
    @StateObject var viewModel: CourseDetailsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(viewModel.courseName)
                .font(.largeTitle)
                .padding()
            ZStack {
                CourseImage(
                    imageData: viewModel.imageData,
                    imageSize: CGSize(width: 360, height: 180),
                    cornerRadius: 30,
                    shadowIsOn: true
                )
                FavoriteStatusButton(isFavorite: viewModel.isFavorite) {
                    viewModel.changeFavoriteStatus()
                }
            }
            Text(viewModel.numberOfLessons)
                .font(.headline)
            Text(viewModel.numberOfTests)
                .font(.headline)
            Spacer()
        }
    }
}

struct FavoriteStatusButton: View {
    var isFavorite: Bool
    var action: () -> Void
    
    var body: some View {
        Image(systemName: isFavorite ? "heart.fill" : "heart")
            .resizable()
            .frame(width: 30, height: 30)
            .offset(x: 155, y: 60)
        
        Button("   ") {
            action()
        }
            .offset(x: 155, y: 60)
    }
}

#Preview {
    CourseDetailsView(
        viewModel: CourseDetailsViewModel(course: Course.getCourse())
    )
}
