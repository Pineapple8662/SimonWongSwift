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
    
    /// 浅色view
    static let lightView: UIColor = {
        if #available(iOS 13.0, *) {
            return dynamicColor(hex_f5f5f7, systemBackground)
        } else {
            return hex_f5f5f7
        }
    }()
    
    // MARK: 字体颜色
    
    /// 深色字体
    static let darkText: UIColor = {
        return dynamicColor(hex_182335, hex_f8f8f8)
    }()
    /// 浅色字体
    static let lightText: UIColor = {
        return dynamicColor(hex_969696, hex_969696)
    }()

    // MARK: 分割线颜色
    
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
    static var hex_f5f5f7 = hex(0xf5f5f7)
    
    // MARK: 字体颜色
    
    /// 深色字体
    static let hex_182335 = hex(0x182335)
    /// 浅色字体
    static let hex_969696 = hex(0x969696)
    
    // MARK: 分割线颜色
    
    /// 分割线颜色0
    static let hex_e9e9e9 = hex(0xe9e9e9)
    
    // MAKE: - Dark颜色
    
    static let hex_f8f8f8 = hex(0xf8f8f8)
    
    /// 黑色导航栏 & TabBar
    static let hex_282828 = hex(0x282828)
    /// Dark cell
    static let hex_323232 = hex(0x323232)
    
}
