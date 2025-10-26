//
//  ContentView.swift
//  CourseDetails
//
//  Created by Alexey Efimov on 06.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var course: Course
    
    var body: some View {
        VStack {
            Text("\(course.name ?? "")")
                .font(.largeTitle)
                        
            VStack(alignment: .leading, spacing: 20) {
                CourseImage(stringURL: course.imageUrl ?? "")
                HStack {
                    Text("Number of lessons: ")
                    Text("\(course.numberOfLessons ?? 0)")
                }
                .font(.headline)
                
                HStack {
                    Text("Number of tests: ")
                    Text("\(course.numberOfTests ?? 0)")
                }
                .font(.headline)
                
            }.padding(.top)
            
            Spacer()
        }.padding(.top)
    }
}

struct CourseImage: View {
    
    var stringURL: String
    
    var body: some View {
        getImage(from: stringURL)
            .resizable()
            .cornerRadius(30)
            .frame(width: 198*1.5, height: 108*1.5)
            .shadow(radius: 10)
    }
    
    private func getImage(from url: String) -> Image {
        guard let imageURL = URL(string: url) else { return Image(systemName: "xmark.shield") }
        guard let imageData = try? Data(contentsOf: imageURL) else { return Image(systemName: "xmark.shield") }
        guard let image = UIImage(data: imageData) else { return Image(systemName: "xmark.shield") }
        return Image(uiImage: image)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(course: Course(
            name: "Course Name",
            imageUrl: "https://swiftbook.org/system/uploads/course/image/467/promo_first_apps_v4.jpg",
            numberOfLessons: 40,
            numberOfTests: 10)
        )
    }
}
