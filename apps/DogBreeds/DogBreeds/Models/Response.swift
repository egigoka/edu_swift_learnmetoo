//
//  Response.swift
//  DogBreeds
//
//  Created by egigoka on 27.07.2025.
//

enum Urls: String {
    case listAllBreeds = "https://dog.ceo/api/breeds/list/all"
    case randomImageByBreed(breed: String, subBreed: String?) -> String {
        if let subBreed = subBreed {
            return "https://dog.ceo/api/breed/\(breed)/\(subBreed)/images/random"
        }
    }
    case randomImageByBreed = "https://dog.ceo/api/breed/%@/images/random"
    case randomImageBySubBreed =
}

struct APIResponse<T: Decodable>: Decodable {
    let message: T
    let status: String
}
