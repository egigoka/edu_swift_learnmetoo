//
//  Course.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Foundation

struct Course: Decodable {
    let name: String?
    let imageUrl: URL?
    let numberOfLessons: Int?
    let numberOfTests: Int?
}
