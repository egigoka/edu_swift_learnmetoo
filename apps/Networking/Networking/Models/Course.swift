//
//  Course.swift
//  Networking
//
//  Created by egigoka on 27.07.2025.
//

//struct Course: Decodable {
//    let name: String?
//    let imageUrl: String?
//    let numberOfLessons: Int?
//    let numberOfTests: Int?
//    
//    enum CodingKeys: String, CodingKey {
//        case name = "Name"
//        case imageUrl = "ImageUrl"
//        case numberOfLessons = "Number_of_lessons"
//        case numberOfTests = "Number_of_tests"
//    }
//}

struct Course: Codable {
    let name: String?
    let imageUrl: String?
    let numberOfLessons: String?
    let numberOfTests: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case imageUrl = "ImageUrl"
        case numberOfLessons = "Number_of_lessons"
        case numberOfTests = "Number_of_tests"
    }
}
