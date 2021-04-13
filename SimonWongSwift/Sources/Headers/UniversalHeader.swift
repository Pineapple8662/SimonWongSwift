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

var UIDevelopingWidth = UIDevice.iPadSeries.all ? (UIScreenWidth - 0.5) / 2 : UIScreenWidth

// MARK: - 特殊的View

/// UIApplication.shared.keyWindow
var keyWindow: UIWindow? {
    get {
        return UIApplication.shared.keyWindow
    }
}

// MARK: - TableView

/// 默认 tableView separatorInset
var DefaultTableViewSeparatorInset: UIEdgeInsets = UIEdgeInsets(top: .zero, left: .leastNonzeroMagnitude, bottom: .zero, right: .zero)

// MARK: - Cell

/// 默认 cell 高度
let DefaultCellHeight: CGFloat = 50
