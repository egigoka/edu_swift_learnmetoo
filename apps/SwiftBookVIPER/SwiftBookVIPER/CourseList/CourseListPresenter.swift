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
}

extension CourseListPresenter: CourseListInteractorOutputProtocol {
    func coursesDidReceive(_ courses: [Course]) {
        let section = CourseSection()
        
        courses.forEach { course in
            section.rows.append(CourseCell(course: course))
        }
        
        view.reloadData(for: section)
    }
}
