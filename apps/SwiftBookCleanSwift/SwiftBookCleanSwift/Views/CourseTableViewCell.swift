//
//  CourseCell.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

protocol CellModelRepresentable {
    var cellModel: CellIdentifier? { get set }
}


final class CourseTableViewCell: UITableViewCell, CellModelRepresentable {
    var cellModel: any CellIdentifier? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let cellModel =
                cellModel as? CourseList.ShowCourses.ViewModel.CourseCellModel
        else { return }
        
    }
}
