//
//  CourseDetailsConfigurator.swift
//  SwiftBookVIPER
//
//  Created by egigoka2kz on 23.09.2026.
//

import Foundation

protocol CourseDetailsConfiguratorProtocol {
    func configure(with view: CourseDetailsViewController, and course: Course)
}

class CourseDetailsConfigurator: CourseDetailsConfiguratorProtocol {
    func configure(with view: CourseDetailsViewController, and course: Course) {
        let presenter = CourseDetailsPresenter(view: view)
        let interactor = CourseDetailsInteractor(presenter: presenter, course: course)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
