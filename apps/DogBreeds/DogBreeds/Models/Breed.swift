//
//  Breed.swift
//  DogBreeds
//
//  Created by egigoka on 27.07.2025.
//

enum BreedType: Decodable {
    case breed
    case subBreed
}

struct Breed: Decodable {
    let name: String
    let type: BreedType
    let subBreed: String?
    var randomPicture: String?
}
