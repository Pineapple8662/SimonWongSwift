//
//  UIColor+Config.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/7/31.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

// MARK: - 动态颜色

extension UIColor {
    
    // MARK: View颜色
    
    /// 浅色view
    static let lightView: UIColor = {
        if #available(iOS 13.0, *) {
            return dynamicColor(hex_f8f8f7, systemBackground)
        } else {
            return hex_f8f8f7
        }
    }()
    
    // MARK: 字体颜色
    
    /// 深色字体
    static let darkText: UIColor = {
        dynamicColor(hex_333333, hex_f8f8f7)
    }()
    /// 浅色字体
    static let lightText: UIColor = {
        dynamicColor(hex_666666, hex_666666)
    }()
    /// 超浅色字体
    static let ultraLightText: UIColor = {
        dynamicColor(hex_999999, hex_999999)
    }()

    // MARK: 分割线颜色
    
    static let separator: UIColor = {
        if #available(iOS 13.0, *) {
            return dynamicColor(hex_f3f3f3, hex_292929)
        } else {
            return hex_f3f3f3
        }
    }()
    
    // MARK: 占位颜色
    
    static let placeholder: UIColor = {
        if #available(iOS 13.0, *) {
            return dynamicColor(.hex(0xe3e6e7), .hex(0x1c1918))
        } else {
            return .hex(0xe3e6e7)
        }
    }()
    
}

// MARK: - 静态颜色

extension UIColor {
    
    // MARK: - Light颜色
    
    // MARK: View颜色
    
    /// 浅色view
    static let hex_f8f8f7 = hex(0xf8f8f7)
    
    // MARK: 字体颜色
    
    /// 深色字体
    static let hex_333333 = hex(0x333333)
    /// 浅色字体
    static let hex_666666 = hex(0x666666)
    /// 超浅色字体
    static let hex_999999 = hex(0x999999)
    
    // MARK: 分割线颜色
    
    /// 分割线颜色
    static let hex_f3f3f3 = hex(0xf3f3f3)
    
    // MAKE: - Dark颜色
    
    /// 黑色导航栏 & TabBar
    static let hex_282828 = hex(0x282828)
    /// Dark cell
    static let hex_323232 = hex(0x323232)
    
    /// 分割线颜色
    static let hex_292929 = hex(0x292929)
    
}
