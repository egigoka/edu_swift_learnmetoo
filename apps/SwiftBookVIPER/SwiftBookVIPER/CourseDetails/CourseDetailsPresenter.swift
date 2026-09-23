//
//  CourseDetailsPresenter.swift
//  SwiftBookVIPER
//
//  Created by egigoka2kz on 23.09.2026.
//

import Foundation

struct CourseDetailsData {
    let courseName: String
    let numberOfLessons: Int
    let numberOfTests: Int
    let imageData: Data?
}

class CourseDetailsPresenter: CourseDetailsViewOutputProtocol {
    unowned let view: CourseDetailsViewInputProtocol
    var interactor: CourseDetailsInteractorInputProtocol!
    
    var isFavorite: Bool {
        interactor.isFavorite
    }
    
    required init(view: any CourseDetailsViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.provideCourseDetails()
    }
    
    func favoriteButtonPressed() {
        interactor.toggleFavoriteStatus()
        view.displayImageForFavoriteButton(with: isFavorite)
    }
}

extension CourseDetailsPresenter: CourseDetailsInteractorOutputProtocol {
    func receiveCourseDetails(with courseData: CourseDetailsData) {
        let numberOfLessons = "Number of lessons: \(courseData.numberOfLessons)"
        let numberOfTests = "Number of tests: \(courseData.numberOfTests)"
        
        view.displayCourseName(with: courseData.courseName)
        view.displayNumberOfLessons(with: numberOfLessons)
        view.displayNumberOfTests(with: numberOfTests)
        view.displayImageForFavoriteButton(with: isFavorite)
        
        if let imageData = courseData.imageData {
            view.displayImage(with: imageData)
        }
    }
    
}
