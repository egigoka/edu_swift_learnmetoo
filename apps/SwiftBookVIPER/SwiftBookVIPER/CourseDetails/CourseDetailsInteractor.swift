//
//  CourseDetailsInteractor.swift
//  SwiftBookVIPER
//
//  Created by egigoka2kz on 23.09.2026.
//

import Foundation

protocol CourseDetailsInteractorInputProtocol: AnyObject {
    init(presenter: CourseDetailsInteractorOutputProtocol, course: Course)
    func provideCourseDetails()
}

protocol CourseDetailsInteractorOutputProtocol: AnyObject {
    func receiveCourseDetails(with courseData: CourseDetailsData)
}

class CourseDetailsInteractor: CourseDetailsInteractorInputProtocol {
    unowned let presenter: CourseDetailsInteractorOutputProtocol
    private let course: Course
    
    required init(presenter: any CourseDetailsInteractorOutputProtocol, course: Course) {
        self.presenter = presenter
        self.course = course
    }
    
    func provideCourseDetails() {
        let courseDetailsData = CourseDetailsData(
            courseName: course.name ?? "",
            numberOfLessons: course.numberOfLessons ?? 0,
            numberOfTests: course.numberOfTests ?? 0
        )
        presenter.receiveCourseDetails(with: courseDetailsData)
    }
}
