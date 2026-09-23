//
//  CourseListInteractor.swift
//  SwiftBookVIPER
//
//  Created by egigoka2kz on 23.09.2026.
//

import Foundation

protocol CourseListInteractorInputProtocol: AnyObject {
    init(presenter: CourseListInteractorOutputProtocol)
}

protocol CourseListInteractorOutputProtocol: AnyObject {
    
}

class CourseListInteractor: CourseListInteractorInputProtocol {
    unowned let presenter: CourseListInteractorOutputProtocol
    
    required init(presenter: any CourseListInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
