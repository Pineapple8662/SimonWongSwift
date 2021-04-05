//
//  UIColor+Universal.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/7/31.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) -> UIColor {
        return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
    
    static func hex(_ hex: Int, a: CGFloat = 1) -> UIColor {
        return rgb(r: (CGFloat((hex & 0xff0000) >> 16)), g: CGFloat((hex & 0xff00) >> 8), b: CGFloat(hex & 0xff), a: a)
    }
    
}
