//
//  CourseCell.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

final class CourseTableViewCell: UITableViewCell {
    private var currentImageURL: URL?

    func configure(with course: Course) {
        var content = defaultContentConfiguration()
        content.text = course.name
        contentConfiguration = content
        currentImageURL = course.imageUrl

        guard let imageURL = course.imageUrl else { return }
        Task { @MainActor [weak self] in
            guard let imageData = await ImageManager.shared.fetchImageData(from: imageURL),
                  let image = UIImage(data: imageData),
                  self?.currentImageURL == imageURL else { return }
            var updatedContent = self?.defaultContentConfiguration()
            updatedContent?.text = course.name
            updatedContent?.image = image
            if let updatedContent {
                self?.contentConfiguration = updatedContent
            }
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        currentImageURL = nil
        contentConfiguration = defaultContentConfiguration()
    }
}
