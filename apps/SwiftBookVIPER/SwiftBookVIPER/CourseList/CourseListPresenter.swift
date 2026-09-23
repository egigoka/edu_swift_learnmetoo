//
//  CourseListPresenter.swift
//  SwiftBookVIPER
//
//  Created by egigoka2kz on 23.09.2026.
//

import Foundation

class CourseListPresenter: CourseListViewOutputProtocol {
    unowned let view: CourseListViewInputProtocol
    var interactor: CourseDetailsInteractorInputProtocol!
    var router: CourseListRouterInputProtocol!
    
    required init(view: any CourseListViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
}

extension CourseListInteractorOutputProtocol {
    
}
