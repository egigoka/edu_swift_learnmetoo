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
        var content = defaultContentConfiguration()
        content.text = cellModel.name
        if let imageData = ImageManager.shared.cachedImageData(for: cellModel.imageURL) {
            content.image = UIImage(data: imageData)
        }
        contentConfiguration = content

        guard let imageURL = cellModel.imageURL else { return }
        Task { @MainActor [weak self] in
            guard let imageData = await ImageManager.shared.fetchImageData(from: imageURL),
                  let self,
                  let current = self.cellModel as? CourseList.ShowCourses.ViewModel.CourseCellModel,
                  current.imageURL == imageURL else { return }
            var updated = self.defaultContentConfiguration()
            updated.text = current.name
            updated.image = UIImage(data: imageData)
            self.contentConfiguration = updated
        }
    }
}
