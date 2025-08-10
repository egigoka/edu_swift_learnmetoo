//
//  PixabayResponse.swift
//  RandomImageSwiftUI
//
//  Created by egigoka on 10.08.2025.
//

struct PixabayResponse: Decodable {
    let hits: [Hit]
}

struct Hit: Decodable {
    let largeImageURL: String
}
