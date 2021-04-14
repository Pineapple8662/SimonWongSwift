//
//  UniversalHeader.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/7/29.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

// MARK: - 尺寸

var UIScreenBounds = UIScreen.main.bounds
var UIScreenWidth = UIScreenBounds.width
var UIScreenHeight = UIScreenBounds.height
var UIScreenScale = UIScreen.main.scale

var UIDevelopingWidth = UIDevice.iPadSeries.all ? (UIScreenWidth - 1) / 2 : UIScreenWidth

var SafeAreaBottomInset = mainWindow?.safeAreaInsets.bottom ?? 0

// MARK: - 特殊的View

let mainWindowTag = 200
var windows: [UIWindow] {
    get {
        return UIApplication.shared.windows
    }
}
var mainWindow: UIWindow? {
    get {
        for window in windows {
            if window.tag == mainWindowTag {
                return window
            }
        }
        return nil
    }
}

// MARK: - TableView

/// 默认 tableView separatorInset
var DefaultTableViewSeparatorInset: UIEdgeInsets = UIEdgeInsets(top: .zero, left: .leastNonzeroMagnitude, bottom: .zero, right: .zero)
