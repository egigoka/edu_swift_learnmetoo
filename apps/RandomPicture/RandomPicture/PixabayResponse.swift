//
//  PixabayResponse.swift
//  RandomPicture
//
//  Created by egigoka on 03.08.2025.
//

struct PixabayResponse: Decodable {
    let total: Int
    let totalHits: Int
    let hits: [PixabayImage]
}

struct PixabayImage: Decodable {
    let imageURL: String
    let user: String
}
