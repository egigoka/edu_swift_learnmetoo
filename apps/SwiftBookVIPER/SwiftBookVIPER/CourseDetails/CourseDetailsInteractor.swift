//
//  CourseDetailsInteractor.swift
//  SwiftBookVIPER
//
//  Created by egigoka2kz on 23.09.2026.
//

import Foundation

protocol CourseDetailsInteractorInputProtocol: AnyObject {
    init(presenter: CourseDetailsInteractorOutputProtocol, course: Course)
    
}

protocol CourseDetailsInteractorOutputProtocol: AnyObject {
    
}

class CourseDetailsInteractor: CourseDetailsInteractorInputProtocol {
    unowned let presenter: CourseDetailsInteractorOutputProtocol
    private let course: Course
    required init(presenter: any CourseDetailsInteractorOutputProtocol, course: Course) {
        self.presenter = presenter
        self.course = course
    }
}
