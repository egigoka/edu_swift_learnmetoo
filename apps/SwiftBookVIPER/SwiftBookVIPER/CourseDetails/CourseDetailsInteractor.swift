//
//  CourseDetailsInteractor.swift
//  SwiftBookVIPER
//
//  Created by egigoka2kz on 23.09.2026.
//

import Foundation

protocol CourseDetailsInteractorInputProtocol: AnyObject {
    var isFavorite: Bool { get set }
    init(presenter: CourseDetailsInteractorOutputProtocol, course: Course)
    func provideCourseDetails()
    func toggleFavoriteStatus()
}

protocol CourseDetailsInteractorOutputProtocol: AnyObject {
    func receiveCourseDetails(with courseData: CourseDetailsData)
}

class CourseDetailsInteractor: CourseDetailsInteractorInputProtocol {
    unowned let presenter: CourseDetailsInteractorOutputProtocol
    private let course: Course
    
    var isFavorite: Bool {
        get {
            DataManager.shared.getFavoriteStatus(for: course.name ?? "")
        } set {
            DataManager.shared.setFavoriteStatus(for: course.name ?? "", with: newValue)
        }
    }
    
    required init(presenter: any CourseDetailsInteractorOutputProtocol, course: Course) {
        self.presenter = presenter
        self.course = course
    }
    
    func provideCourseDetails() {
        let courseDetailsData = CourseDetailsData(
            courseName: course.name ?? "",
            numberOfLessons: course.numberOfLessons ?? 0,
            numberOfTests: course.numberOfTests ?? 0,
            imageData: ImageManager.shared.fetchImageData(from: course.imageUrl)
        )
        presenter.receiveCourseDetails(with: courseDetailsData)
    }
    
    func toggleFavoriteStatus() {
        isFavorite.toggle()
    }
}
