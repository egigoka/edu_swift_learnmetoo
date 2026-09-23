//
//  CourseDetailsPresenter.swift
//  SwiftBookVIPER
//
//  Created by egigoka2kz on 23.09.2026.
//

import Foundation

struct CourseDetailsData {
    
}

class CourseDetailsPresenter: CourseDetailsViewOutputProtocol {
    unowned view: CourseDetailsViewInputProtocol
    var interactor: CourseDetailsInteractorInputProtocol!
    
    required init(view: any CourseDetailsViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        
    }
    
    
}

extension CourseDetailsPresenter: CourseDetailsInteractorOutputProtocol {
    
}
