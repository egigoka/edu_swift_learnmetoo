//
//  Response.swift
//  DogBreeds
//
//  Created by egigoka on 27.07.2025.
//

struct APIResponse<T: Decodable>: Decodable {
    let message: T
    let status: String
}
