//
//  Url.swift
//  RandomImageSwiftUI
//
//  Created by egigoka on 10.08.2025.
//

final class Url: Sendable {
    
    static let shared = Url()
    
    private init() {}
    
    func encode(_ string: String) -> String {
        string.replacingOccurrences(of: " ", with: "+")
    }
}
