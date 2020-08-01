//
//  UIColor+Config.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/7/31.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

// MARK: - 动态颜色

extension UIColor {
    
    // MARK: View 颜色
    
    /// 浅色view ebebeb
    static let lightView: UIColor = {
        if #available(iOS 13.0, *) {
            return dynamicColor(hex_ebebeb, systemBackground)
        } else {
            return hex_ebebeb
        }
    }()

    // MARK: 分割线颜色
    
    /// e9e9e9
    static let customSeparator0: UIColor = {
        if #available(iOS 13.0, *) {
            return dynamicColor(hex_e9e9e9, separator)
        } else {
            return hex_e9e9e9
        }
    }()
    
}

// MARK: - 静态颜色

extension UIColor {
    
    // MARK: - Light颜色
    
    // MARK: View颜色
    
    /// 浅色view
    static var hex_ebebeb = hex(0xebebeb)
    
    // MARK: 分割线颜色
    
    /// 分割线颜色0
    static let hex_e9e9e9 = hex(0xe9e9e9)
    
    // MAKE: - Dark颜色
    
    /// 黑色导航栏 & TabBar
    static let hex_282828 = hex(0x282828)
    /// Dark cell
    static let hex_323232 = hex(0x323232)
    
}
