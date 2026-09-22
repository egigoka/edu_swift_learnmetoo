//
//  CourseDetailsViewModel.swift
//  SwiftBookSwiftUIMVVM
//
//  Created by egigoka2kz on 20.09.2026.
//

import Foundation
import Combine

protocol CourseDetailsViewModelProtocol {
    var courseName: String { get }
    var imageData: Data? { get }
    var numberOfLessons: String { get }
    var numberOfTests: String { get }
    var isFavorite: Bool { get }
    
    init(course: Course)
    
    func changeFavoriteStatus()
}

class CourseDetailsViewModel: CourseDetailsViewModelProtocol, ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        NetworkManager.shared.fetchImageData(from: course.imageUrl)
    }
    
    var numberOfLessons: String {
        "Number of lessons: \(course.numberOfLessons)"
    }
    
    var numberOfTests: String {
        "Number of tests \(course.numberOfTests)"
    }
    
    @Published var isFavorite: Bool {
        didSet {
            DataManager.shared.saveFavouriteStatus(
                for: course.name,
                with: isFavorite
            )
            objectWillChange.send()
        }
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
        isFavorite = DataManager.shared.loadFavouriteStatus(for: course.name)
    }
    
    func changeFavoriteStatus() {
        isFavorite.toggle()
    }
}
