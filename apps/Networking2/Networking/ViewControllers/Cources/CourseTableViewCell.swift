//
//  CourseCell.swift
//  Networking
//
//  Created by egigoka on 27.07.2025.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var numberOfTests: UILabel!
    
    func configure(with course: Course) {
        var content = defaultContentConfiguration()
        content.text = course.name
        Task { [weak self] in
            let imageData = await ImageManager.shared.fetchImage(from: course.imageUrl)
            content.image = imageData
            self?.contentConfiguration = content
        }
    }
}
