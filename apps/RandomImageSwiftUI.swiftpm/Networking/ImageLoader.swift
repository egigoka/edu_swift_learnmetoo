//
//  ImageLoader.swift
//  RandomImageSwiftUI
//
//  Created by egigoka on 10.08.2025.
//

import SwiftUI

@MainActor
final class ImageLoader: ObservableObject {
    @Published var imageUrl: URL?
    
    func fetchRandomImage(with key: String) async {
        let encodedKey = Url.shared.encode(key)
        let urlString = "https://pixabay.com/api/?key=\(Secrets.shared.pixabayKey)&q=\(encodedKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(PixabayResponse.self, from: data)
            if let randomUrl = result.hits.randomElement()?.largeImageURL,
               let url = URL(string: randomUrl) {
                imageUrl = url
            }
        } catch {
            print("Error fetching image: \(error)")
        }
        
    }
}
