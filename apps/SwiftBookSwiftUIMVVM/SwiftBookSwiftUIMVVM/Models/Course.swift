//
//  Course.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 17.08.2020.
//

struct Course: Decodable {
    let name: String
    let imageUrl: String
    let numberOfLessons: Int
    let numberOfTests: Int
    
    static func getCourse() -> Course {
        Course(
            name: "Course Name",
            imageUrl: "https://swiftbook.ru/wp-content/uploads/2018/03/2-courselogo.jpg",
            numberOfLessons: 40,
            numberOfTests: 10
        )
    }
}
