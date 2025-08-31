//
//  CharacterImageView.swift
//  RickAndMorty
//
//  Created by Alexey Efimov on 19.11.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class CharacterImageView: UIImageView {
    
    func fetchImage(from url: String) {
        guard let imageUrl = URL(string: url) else {
            image = UIImage(named: "picture")
            return
        }
        
    }
}
