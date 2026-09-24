//
//  CourseCell.swift
//  SwiftBookVIPER
//
//  Created by egigoka2kz on 24.09.2026.
//

import Foundation

protocol CellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Float { get }
}

protocol SectionRowsRepresentable {
    var rows: [CellIdentifiable] { get set }
}

class CourseCell: CellIdentifiable {
    let name: String
    let imageURL: URL?
    
    var cellIdentifier: String {
        "CourseCell"
    }
    
    var cellHeight: Float {
        100
    }
    
    init(course: Course) {
        name = course.name ?? ""
        imageURL = course.imageUrl
    }
}

class CourseSection: SectionRowsRepresentable {
    var rows: [any CellIdentifiable] = []
}
