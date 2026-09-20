//
//  DataManager.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 17.08.2020.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    func saveFavouriteStatus(for courseName: String, with status: Bool) {
        userDefaults.set(status, forKey: courseName)
    }
    
    func loadFavouriteStatus(for courseName: String) -> Bool {
        userDefaults.bool(forKey: courseName)
    }
}
