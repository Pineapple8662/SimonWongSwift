//
//  UIColor+Random.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/8/1.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var random: UIColor {
        get {
            let r: CGFloat = CGFloat(UInt.random(in: 0...255))
            let g: CGFloat = CGFloat(UInt.random(in: 0...255))
            let b: CGFloat = CGFloat(UInt.random(in: 0...255))
            return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: 1)
        }
    }
    
}
