//
//  Course.swift
//  Networking
//
//  Created by egigoka on 27.07.2025.
//

struct Course: Decodable {
    let name: String
    let image: String
    let number_of_lessons: Int
    let number_of_tests: Int
}
