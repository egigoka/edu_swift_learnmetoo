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
    
    var fullName: String {
        var name = name
        if let subBreed = subBreed {
            name = "\(subBreed) \(name)"
        }
        return name
    }
    
    static func getBreeds(from breedsDict: Dictionary<String, Any>) -> [Breed] {
        var breeds: [Breed] = []
        for (breed, subBreeds) in breedsDict {
            guard let subBreeds = subBreeds as? [String] else { continue }
            if subBreeds.count == 0 {
                breeds.append(Breed(name: breed, type: .breed, subBreed: nil))
            } else {
                for subBreed in subBreeds {
                    breeds.append(Breed(name: breed, type: .subBreed, subBreed: subBreed))
                }
            }
        }
        
        return breeds
    }
}
