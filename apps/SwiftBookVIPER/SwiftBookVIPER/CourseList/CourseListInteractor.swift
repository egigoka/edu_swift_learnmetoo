//
//  CourseListInteractor.swift
//  SwiftBookVIPER
//
//  Created by egigoka2kz on 23.09.2026.
//

import Foundation

protocol CourseListInteractorInputProtocol: AnyObject {
    init(presenter: CourseListInteractorOutputProtocol)
    func fetchCourses()
    func getCourse(at indexPath: IndexPath)
}

protocol CourseListInteractorOutputProtocol: AnyObject {
    func coursesDidReceive(_ courses: [Course])
    func courseDidReceive(_ course: Course)
}

class CourseListInteractor: CourseListInteractorInputProtocol {
    unowned let presenter: CourseListInteractorOutputProtocol
    
    required init(presenter: any CourseListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchCourses() {
        NetworkManager.shared.fetchData { [unowned self] courses in
            self.presenter.coursesDidReceive(courses)
        }
    }
    
    func getCourse(at indexPath: IndexPath) {
        let course = DataManager.shared.getCourse(at: indexPath)
        presenter.courseDidReceive(course)
    }
}
