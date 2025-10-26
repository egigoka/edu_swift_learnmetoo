//
//  ImageManager.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 20.12.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation 

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: String?) -> Data {
        guard let stringURL = url else { return Data() }
        guard let imageURL = URL(string: stringURL) else { return Data() }
        guard let imageData = try? Data(contentsOf: imageURL) else { return Data() }
        return imageData
    }
}
