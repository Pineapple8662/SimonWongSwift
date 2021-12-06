//
//  UIFont+Universal.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/8/1.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

extension UIFont {
    
    // MARK: - 字体
    
    static func lightSystemFont(ofSize fontSize: CGFloat) -> UIFont {
        return .systemFont(ofSize: fontSize, weight: .light)
    }
    
    static func regularSystemFont(ofSize fontSize: CGFloat) -> UIFont {
        return .systemFont(ofSize: fontSize, weight: .regular)
    }
    
    static func mediumSystemFont(ofSize fontSize: CGFloat) -> UIFont {
        return .systemFont(ofSize: fontSize, weight: .medium)
    }
    
    static func semiboldSystemFont(ofSize fontSize: CGFloat) -> UIFont {
        .systemFont(ofSize: fontSize, weight: .semibold)
    }
    
}
