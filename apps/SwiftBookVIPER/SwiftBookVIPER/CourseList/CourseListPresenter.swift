//
//  CourseListPresenter.swift
//  SwiftBookVIPER
//
//  Created by egigoka2kz on 23.09.2026.
//

import Foundation

class CourseListPresenter: CourseListViewOutputProtocol {
    
    unowned let view: CourseListViewInputProtocol
    var interactor: CourseListInteractorInputProtocol!
    var router: CourseListRouterInputProtocol!
    
    required init(view: any CourseListViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchCourses()
    }
    
    func didTapCell(at indexPath: IndexPath) {
        interactor.getCourse(at: indexPath)
    }
}

extension CourseListPresenter: CourseListInteractorOutputProtocol {
    func coursesDidReceive(_ courses: [Course]) {
        let section = CourseSection()
        
        courses.forEach { course in
            section.rows.append(CourseCell(course: course))
        }
        
        view.reloadData(for: section)
    }
    
    func courseDidReceive(_ course: Course) {
        router.openCourseDetailsViewController(with: course)
    }
}
