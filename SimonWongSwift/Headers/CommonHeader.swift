//
//  CommonHeader.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/7/29.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

// MARK: - 尺寸

var UIStatusBarHeight: CGFloat {
    get {
        if UIDevice.iPhoneSeries.all {
            return (UIDevice.iPhoneSeries.screenSizeIsGreaterThanOrEqual_iPhoneX ? 44 : 20)
        } else {
            return (UIDevice.iPadSeries.roundedCorners ? 30 : 20)
        }
    }
}
var UINavigationBarHeight: CGFloat = (UIStatusBarHeight + 44)
var UISafeAreaBottomMargin: CGFloat {
    get {
        if UIDevice.iPhoneSeries.all {
            return (UIDevice.iPhoneSeries.screenSizeIsGreaterThanOrEqual_iPhoneX ? 34 : 0)
        } else {
            return (UIDevice.iPadSeries.roundedCorners ? 15 : 0)
        }
    }
}
var UITabBarHeight: CGFloat = (UISafeAreaBottomMargin + 49)

var UIScreenBounds = UIScreen.main.bounds
var UIScreenWidth = UIScreenBounds.width
var UIScreenHeight = UIScreenBounds.height
var UIScreenScale = UIScreen.main.scale

var UIDevelopingWidth = UIDevice.iPadSeries.all ? (UIScreenWidth - 0.5) / 2 : UIScreenWidth
var UIMainHeight: CGFloat = (UIScreenHeight - UINavigationBarHeight)

// MARK: - 特殊的View

/// UIApplication.shared.keyWindow
var keyWindow: UIWindow? {
    get {
        return UIApplication.shared.keyWindow
    }
}

/// 默认左右间距
var UISafeAreaLeftRightMargin: CGFloat = (min(UIScreenWidth, UIScreenHeight) == 414 ? 20 : 15)

// MARK: - TableView

/// 默认 tableView separatorInset
var DefaultTableViewSeparatorInset: UIEdgeInsets = UIEdgeInsets(top: .zero, left: CGFloat.leastNonzeroMagnitude, bottom: .zero, right: .zero)

// MARK: - Cell

/// 默认 cell 高度
let DefaultCellHeight: CGFloat = 50
