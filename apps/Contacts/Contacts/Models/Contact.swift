//
//  Contact.swift
//  UIAdaptivePresentation
//
//  Created by Alexey Efimov on 20.11.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

struct Contact {
    let firstName: String
    let lastName: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
