//
//  AppDelegate+Config.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/10/16.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    func configureBases() {
        AppDelegate.configureAppearance()
        AppDelegate.configureIQKeyboardManager()
        AppDelegate.configureAdapter()
    }
    
    private static func configureAppearance() {
        // UINavigationBar
        let navigationBar = UINavigationBar.appearance()
        navigationBar.barStyle = .default // 主题
        navigationBar.isTranslucent = false // 透明
        navigationBar.tintColor = .darkText // 按钮颜色
        navigationBar.barTintColor = .dynamicColor(.white, .hex_282828) // 背景颜色
        navigationBar.shadowImage = UIImage() // 去除分割线
        navigationBar.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 18), .foregroundColor: UIColor.darkText] // 标题
        
        // UILabel
        UILabel.appearance().backgroundColor = .clear // 用于可视化测试调节颜色后还是显示透明
        // UITextField
        UITextField.appearance().tintColor = .darkText
        // UITextView
        UITextView.appearance().tintColor = .darkText
        UITextView.appearance().keyboardDismissMode = .none
        // UISwitch
        UISwitch.appearance().onTintColor = .darkText
//        UISwitch.appearance().tintColor = .disabled
        // UIScrollView
        UIScrollView.appearance().keyboardDismissMode = .onDrag
        // UITableViewCell
        UITableViewCell.appearance().tintColor = .darkText
    }
    
    private static func configureIQKeyboardManager() {
        let manager = IQKeyboardManager.shared
        manager.enable = true
        manager.shouldToolbarUsesTextFieldTintColor = true
        manager.placeholderFont = .mediumSystemFont(ofSize: 15)
        manager.shouldResignOnTouchOutside = true
        manager.enableAutoToolbar = false
    }
    
    private static func configureAdapter() {
        CATextLayer.useAdapter()
        UIFont.useAdapter()
        UILabel.useAdapter()
        UIButton.useAdapter()
        UITextField.useAdapter()
        UITextView.useAdapter()
    }
    
}

