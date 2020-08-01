//
//  UIDevice+Common.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/7/31.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

extension UIDevice {
    
    // MARK: - 机型判断
    
    /// 模拟器
    static let simulator: Bool = {
        var simulator = false
        #if arch(i386) || arch(x86_64)
        simulator = true
        #endif
        return simulator
    }()
    
    /// iPhone
    struct iPhoneSeries {
        static let all = UIDevice.current.userInterfaceIdiom == .phone
        /// iPhone SE, iPhone 5s, iPhone 5, iPhone 4s 及其以下 与 iPod 系列
        static let iPhoneSE_or_lower = (all && max(UIScreenWidth, UIScreenHeight) <= 568)
        /// iPhone 6, iPhone 6s, iPhone 7, iPhone 8
        static let seriesOfiPhone8 = (all && min(UIScreenWidth, UIScreenHeight) == 375 && max(UIScreenWidth, UIScreenHeight) == 667)
        /// iPhone 6 Plus, iPhone 6s Plus, iPhone 7 Plus, iPhone 8 Plus
        static let seriesOfiPhone8Plus = (all && min(UIScreenWidth, UIScreenHeight) == 414 && max(UIScreenWidth, UIScreenHeight) == 736)
        /// iPhone X, iPhone Xs, iPhone Xs Max, iPhone Xr, iPhone 11, iPhone 11 Pro, iPhone 11 Pro Max
        static let iPhoneX_or_higher: Bool = {
            if #available(iOS 11.0, *) {
                return (all && max(UIScreenWidth, UIScreenHeight) >= 812)
            } else {
                return false
            }
        }()
        /// width判断
        static var screenWidth375 = (all && min(UIScreenWidth, UIScreenHeight) == 375)
        static var screenWidth414 = (all && min(UIScreenWidth, UIScreenHeight) == 414)
    }
    
    /*
     * iPad Pro (10.5-inch) 834 * 1112
     * iPad Pro (12.9-inch) (2rd generation) 1024 * 1366
     * iPad Pro (11-inch) 834 * 1194
     * iPad Pro (12.9-inch) (3rd generation) 1024 * 1366
     */
    
    /// iPad
    struct iPadSeries {
        static let all = UIDevice.current.userInterfaceIdiom == .pad
        /// 圆角屏 待完成
        static let roundedCorners = (all && max(UIScreenWidth, UIScreenHeight) == 1194) || (all && max(UIScreenWidth, UIScreenHeight) == 1366)
    }
    
    static let roundedCornersSeries = iPhoneSeries.iPhoneX_or_higher || iPadSeries.roundedCorners
    
}

