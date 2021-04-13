//
//  UIColor+DynamicColor.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/7/31.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func dynamicColor(_ lightColor: UIColor, _ darkColor: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            let dyColor = UIColor { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .light {
                    return lightColor
                } else {
                    return darkColor
                }
            }
            return dyColor
        } else {
            return lightColor
        }
    }
    
}
