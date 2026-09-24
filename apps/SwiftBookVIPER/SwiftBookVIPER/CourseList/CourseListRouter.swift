//
//  CourseListRouter.swift
//  SwiftBookVIPER
//
//  Created by egigoka2kz on 23.09.2026.
//

import UIKit

protocol CourseListRouterInputProtocol: AnyObject {
    init(viewController: CourseListViewController)
    func openCourseDetailsViewController(with course: Course)
}

class CourseListRouter: CourseListRouterInputProtocol {
    unowned let viewController: CourseListViewController
    
    required init(viewController: CourseListViewController) {
        self.viewController = viewController
    }
    
    func openCourseDetailsViewController(with course: Course) {
        viewController.performSegue(
            withIdentifier: "ShowDetails",
            sender: course
        )
    }
}
