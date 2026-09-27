//
//  CourseListConfigurator.swift
//  SwiftBookCleanSwift
//
//  Created by egigoka2kz on 27.09.2026.
//

final class CourseListConfigurator {
    static let shared = CourseListConfigurator()
    
    private init() {}
    
    func configure(with viewController: CourseListViewController) {
        let interactor = CourseListInteractor()
        let presenter = CourseListPresenter()
        let router = CourseListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
