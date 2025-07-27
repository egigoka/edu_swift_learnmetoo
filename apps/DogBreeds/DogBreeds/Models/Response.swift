//
//  Response.swift
//  DogBreeds
//
//  Created by egigoka on 27.07.2025.
//

enum Url {
    case listAllBreeds
    case randomImage(breed: String)
    case randomImageWithSubBreed(breed: String, subBreed: String)

    var urlString: String {
        switch self {
        case .listAllBreeds:
            return "https://dog.ceo/api/breeds/list/all"
        case .randomImage(let breed):
            return "https://dog.ceo/api/breed/\(breed)/images/random"
        case .randomImageWithSubBreed(let breed, let subBreed):
            return "https://dog.ceo/api/breed/\(breed)/\(subBreed)/images/random"
        }
    }
}

struct APIResponse<T: Decodable>: Decodable {
    let message: T
    let status: String
}
