//
//  CourseCell.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

protocol CellRepresentable {
    var courseCell: CellIdentifiable? { get set }
}

class CourseTableViewCell: UITableViewCell, CellRepresentable {
    var courseCell: (any CellIdentifiable)? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let courseCell = courseCell as? CourseCell else { return }
        var content = defaultContentConfiguration()
        content.text = courseCell.name
        if let imageData = ImageManager.shared.fetchImageData(from: courseCell.imageURL) {
            content.image = UIImage(data: imageData)
        }
        contentConfiguration = content
    }
}
