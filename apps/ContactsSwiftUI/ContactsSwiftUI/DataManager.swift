//
//  DataManager.swift
//  ContactsSwiftUI
//
//  Created by egigoka2kz on 31.08.2026.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private init() {}
    
    let names = ["Alice", "Bob", "Charlie", "David", "Eve",
                 "Frank", "Grace", "Hannah", "Ivy", "Jack"]
    
    let surnames = ["Smith", "Johnson", "Williams", "Jones", "Brown",
                    "Davis", "Miller", "Wilson", "Moore", "Taylor"]
    
    let phones = ["123-456-7890", "234-567-8901", "345-678-9012",
                  "456-789-0123", "567-890-1234", "745-842-4567",
                  "876-543-2109", "987-654-3210", "012-345-6789",
                  "111-222-3333"]
}
