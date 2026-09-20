//
//  CourseListViewModel.swift
//  SwiftBookSwiftUIMVVM
//
//  Created by egigoka2kz on 20.09.2026.
//

import Foundation
import Combine

protocol CourseListViewModelProtocol {
    var courses: [Course] { get }
}

class CourseListViewModel: ObservableObject {
    @Published var courses: [Course] = []
    
    func fetchCourses() {
        NetworkManager.shared.fetchCourses { courses in
            self.courses = courses
        }
    }
}
