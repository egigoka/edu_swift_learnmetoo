//
//  Course.swift
//  Networking
//
//  Created by egigoka on 27.07.2025.
//

struct Course: Codable {
    let name: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
    
//    enum CodingKeys: String, CodingKey {
//        case name = "Name"
//        case imageUrl = "ImageUrl"
//        case numberOfLessons = "Number_of_lessons"
//        case numberOfTests = "Number_of_tests"
//    }
    
    init(from courseData: [String: Any]) {
        name = courseData["name"] as? String
        imageUrl = courseData["imageUrl"] as? String
        numberOfLessons = courseData["number_of_lessons"] as? Int
        numberOfTests = courseData["number_of_tests"] as? Int
    }
    
    init(from courseString: CourseStrings) {
        self.name = courseString.name
        self.imageUrl = courseString.imageUrl
        self.numberOfLessons = Int(courseString.numberOfLessons ?? "")
        self.numberOfTests = Int(courseString.numberOfTests ?? "")
    }
    
    static func getCourses(from value: Any) -> [Course]? {
        guard let coursesData = value as? [[String: Any]] else { return nil }
//        var courses: [Course]? = []
//        
//        for courseData in coursesData {
//            let course = Course(from: courseData)
//            courses?.append(course)
//        }
//        return courses
        return coursesData.compactMap { Course(from: $0) }
    }
}

struct CourseStrings: Codable {
    let name: String?
    let imageUrl: String?
    let numberOfLessons: String?
    let numberOfTests: String?
    
//    enum CodingKeys: String, CodingKey {
//        case name = "Name"
//        case imageUrl = "ImageUrl"
//        case numberOfLessons = "Number_of_lessons"
//        case numberOfTests = "Number_of_tests"
//    }
}
