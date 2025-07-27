//
//  WebsiteDescription.swift
//  Networking
//
//  Created by egigoka on 27.07.2025.
//

struct WebsiteDescription: Decodable {
    let courses: [Course]?
    let websiteDescription: String?
    let websiteName: String?
}
