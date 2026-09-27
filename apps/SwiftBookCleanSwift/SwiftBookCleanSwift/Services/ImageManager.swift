//
//  ImageManager.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 03.01.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import Foundation

final class ImageManager {
    static let shared = ImageManager()

    private let cache = NSCache<NSURL, NSData>()

    private init() {}

    /// Sync, cache-only read. Never touches network. Safe on main thread.
    func cachedImageData(for url: URL?) -> Data? {
        guard let url else { return nil }
        return cache.object(forKey: url as NSURL) as Data?
    }

    func fetchImageData(from url: URL?) async -> Data? {
        guard let url else { return nil }
        if let cached = cache.object(forKey: url as NSURL) {
            return cached as Data
        }
        guard let (data, _) = try? await URLSession.shared.data(from: url) else { return nil }
        cache.setObject(data as NSData, forKey: url as NSURL)
        return data
    }
}
