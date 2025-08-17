//
//  User.swift
//  ReqResAppSwiftUI
//
//  Created by egigoka on 17.08.2025.
//

import Foundation

public struct User: Decodable, Identifiable {
    
    public let id: Int
    let firstName: String
    let lastName: String
    let avatar: URL?
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    static let example = User(
        id: 2,
        firstName: "Jane",
        lastName: "Flower",
        avatar: URL(string: "https://reqres.in/img/faces/7-image.jpg")!
    )
    
    init(id: Int, firstName: String, lastName: String, avatar: URL? = nil) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
    }
    
    init(postUserQuery: PostUserQuery) {
        self.id = 0
        self.firstName = postUserQuery.firstName
        self.lastName = postUserQuery.lastName
        self.avatar = nil
    }
}

struct UsersQuery: Decodable {
    let data: [User]
}

struct PostUserQuery: Codable {
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "name"
        case lastName = "job"
    }
}
