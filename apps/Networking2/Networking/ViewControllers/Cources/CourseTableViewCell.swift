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
        print(course)
        courseNameLabel.text = course.name
        numberOfTests.text = "\(course.numberOfTests ?? 0) Tests"
        numberOfLessons.text = "\(course.numberOfLessons ?? 0) Lessons"
        Task { [weak self] in
            guard let self = self else { return }
            let imageData = await ImageManager.shared.fetchImage(from: course.imageUrl)
            self.courseImage.image = imageData
        }
    }
}
