//
//  NetworkManager.swift
//  DogBreeds
//
//  Created by egigoka on 27.07.2025.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func get(from url: URL) async -> Any? {
        do {
            return try await withCheckedThrowingContinuation { continuation in
                AF.request(url)
                    .validate()
                    .responseJSON { data in
                        switch data.result {
                        case .success(let data):
                            continuation.resume(returning: data)
                        case .failure(let error):
                            print(error)
                            continuation.resume(returning: nil)
                        }
                    }
            }
        } catch let error {
            print(error)
            return nil
        }
        
    }
    
    func getUrlOfRAndomImage(for breed: Breed) -> URL? {
        var url: URL?
        
        switch breed.type {
        case .breed:
            url = URL(string: Url.randomImage(breed: breed.name).urlString)
        case .subBreed:
            guard let subBreed = breed.subBreed else { return nil }
            url = URL(string: Url.randomImageWithSubBreed(
                breed: breed.name,
                subBreed: subBreed
            ).urlString)
        }
        return url
    }
}
