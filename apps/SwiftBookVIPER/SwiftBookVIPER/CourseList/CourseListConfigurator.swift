//
//  CourseListConfigurator.swift
//  SwiftBookVIPER
//
//  Created by egigoka2kz on 23.09.2026.
//

import Foundation

protocol CourseListConfiguratorProtocol: AnyObject {
    func configure(with ViewController: CourseListViewController)
}

class CourseListConfigurator: CourseListConfiguratorProtocol {
    func configure(with ViewController: CourseListViewController) {
        let presenter = CourseListPresenter(view: ViewController)
        let interactor = CourseListInteractor(presenter: presenter)
        let router = CourseListRouter(viewController: ViewController)
        
        ViewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
