//
//  TableViewCell.swift
//  RickAndMorty
//
//  Created by Alexey Efimov on 03.03.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImageView: CharacterImageView! {
        didSet {
            characterImageView.contentMode = .scaleAspectFit
            characterImageView.clipsToBounds = true
            characterImageView.layer.cornerRadius = characterImageView.bounds.height / 2
            characterImageView.backgroundColor = .white
        }
    }
    
    // MARK: - Public methods
    func configure(with result: Result?) {
        nameLabel.text = result?.name
        characterImageView.fetchImage(from: result?.image ?? "")
    }
}
