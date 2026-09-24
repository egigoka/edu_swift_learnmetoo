//
//  DataManger.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private var courses: [Course] = []
    private let userDefaults = UserDefaults()
    
    private init() {}
    
    func setFavoriteStatus(for courseName: String, with status: Bool) {
        userDefaults.set(status, forKey: courseName)
    }
    
    func getFavoriteStatus(for courseName: String) -> Bool {
        userDefaults.bool(forKey: courseName)
    }
    
    func setCourses(_ courses: [Course]) {
        self.courses = courses
    }
    
    func getCourse(at indexPath: IndexPath) -> Course {
        courses[indexPath.row]
    }
}
