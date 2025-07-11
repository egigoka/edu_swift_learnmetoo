//
//  File.swift
//  MoodPop
//
//  Created by egigoka on 03.07.2025.
//

import UIKit

extension NSLayoutConstraint {
    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        guard let firstItem = self.firstItem else {
            print("firstItem is nil")
            return self
        }
        return NSLayoutConstraint(item: firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
    
    func constraintWithConstant(_ constant: CGFloat) -> NSLayoutConstraint {
        guard let firstItem = self.firstItem else {
            print("firstItem is nil")
            return self
        }
        return NSLayoutConstraint(item: firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: self.multiplier, constant: constant)
    }
}
