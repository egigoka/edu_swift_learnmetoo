//
//  Breed.swift
//  DogBreeds
//
//  Created by egigoka on 27.07.2025.
//

enum BreedType {
    case breed
    case subBreed
}

struct Breed {
    let name: String
    let subBreeds: [String]
}
