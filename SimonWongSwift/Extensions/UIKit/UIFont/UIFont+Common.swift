//
//  UIFont+Common.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/8/1.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

extension UIFont {
    
    // MARK: - 字体
    
    static func lightSystemFont(ofSize fontSize: CGFloat) -> UIFont {
        return .systemFont(ofSize: fontSize, weight: UIFont.Weight.light)
    }
    
    static func regularSystemFont(ofSize fontSize: CGFloat) -> UIFont {
        return .systemFont(ofSize: fontSize, weight: UIFont.Weight.regular)
    }
    
    static func mediumSystemFont(ofSize fontSize: CGFloat) -> UIFont {
        return .systemFont(ofSize: fontSize, weight: UIFont.Weight.medium)
    }
    
}
