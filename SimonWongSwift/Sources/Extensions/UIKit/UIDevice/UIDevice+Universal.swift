//
//  UIDevice+Universal.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/7/31.
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
    
    /*
     * iPhone SE / iPhone 5s / iPhone 5 (4-inch) 320pt * 568pt @2x
     * iPhone 6, iPhone 6s, iPhone 7, iPhone 8, iPhone SE 2nd generation (4.7-inch) 375pt * 667pt @2x
     * iPhone 6 Plus, iPhone 6s Plus, iPhone 7 Plus, iPhone 8 Plus (5.5-inch) 414pt * 736pt @3x
     * iPhone X, iPhone Xs, iPhone 11 Pro, iPhone 12 mini 375pt * 812pt @3x
     * iPhone Xr, iPhone Xs Max, iPhone 11, iPhone 11 Pro Max 414pt * 896pt @2x || @3x
     * iPhone 12, iPhone 12 Pro 390pt * 844pt @3x
     * iPhone 12 Pro Max 428pt * 926pt @3x
     */
    
    /// iPhone
    struct iPhoneSeries {
        
        /// all
        static let all = UIDevice.current.userInterfaceIdiom == .phone
        
        /// 全面屏 - 带圆角
        static var roundedCorner: Bool {
            get {
                if iPhoneSeries.all {
                    if #available(iOS 11.0, *) {
                        return SafeAreaBottomInset > 0
                    }
                }
                return false
            }
        }
        
        /// iPhone SE, iPhone 5s, iPhone 5, iPhone 4s 及其以下
        static let screenSizeIsLessThanOrEqual_iPhoneSE = (all && max(UIScreenWidth, UIScreenHeight) <= 568)
        /// iPhone 6, iPhone 6s, iPhone 7, iPhone 8
        static let screenSizeIsEqual_iPhone8 = (all && min(UIScreenWidth, UIScreenHeight) == 375 && max(UIScreenWidth, UIScreenHeight) == 667)
        /// iPhone 6 Plus, iPhone 6s Plus, iPhone 7 Plus, iPhone 8 Plus
        static let screenSizeIsEqual_iPhone8Plus = (all && min(UIScreenWidth, UIScreenHeight) == 414 && max(UIScreenWidth, UIScreenHeight) == 736)
        /// iPhone X, iPhone Xs, iPhone 11 Pro, iPhone 12 mini
        static let screenSizeIsEqual_iPhoneX = (all && min(UIScreenWidth, UIScreenHeight) == 375 && max(UIScreenWidth, UIScreenHeight) == 812)
        /// iPhone Xr, iPhone Xs Max, iPhone 11, iPhone 11 Pro Max
        static let screenSizeIsEqual_iPhoneXr = (all && min(UIScreenWidth, UIScreenHeight) == 414 && max(UIScreenWidth, UIScreenHeight) == 896)
        /// iPhone 12, iPhone 12 Pro
        static let screenSizeIsEqual_iPhone12 = (all && min(UIScreenWidth, UIScreenHeight) == 390 && max(UIScreenWidth, UIScreenHeight) == 844)
        /// iPhone 12 Pro Max
        static let screenSizeIsEqual_iPhone12ProMax = (all && min(UIScreenWidth, UIScreenHeight) == 428 && max(UIScreenWidth, UIScreenHeight) == 926)
        
    }
    
    /// iPad
    struct iPadSeries {
        
        /// all
        static let all = UIDevice.current.userInterfaceIdiom == .pad
        
        /// 全面屏 - 带圆角
        static var roundedCorner: Bool {
            get {
                if iPadSeries.all {
                    if #available(iOS 11.0, *) {
                        return SafeAreaBottomInset > 0
                    }
                }
                return false
            }
        }
        
    }
    
    /// 全面屏
    static var roundedCorner: Bool {
        
        return iPhoneSeries.roundedCorner || iPadSeries.roundedCorner
        
    }
    
}

