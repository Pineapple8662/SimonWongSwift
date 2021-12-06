//
//  AppDelegate+Config.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/10/16.
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
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground() // 主题
            appearance.backgroundColor = .dynamicColor(.white, .hex_282828) // 背景颜色
            appearance.shadowColor = .clear // 分割线
            appearance.titleTextAttributes = [.font: UIFont.mediumSystemFont(ofSize: 17), .foregroundColor: UIColor.darkText] // 标题
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationBar.barStyle = .default // 主题
            navigationBar.isTranslucent = false // 透明
            navigationBar.barTintColor = .dynamicColor(.white, .hex_282828) // 背景颜色
            navigationBar.shadowImage = UIImage() // 分割线
            navigationBar.titleTextAttributes = [.font: UIFont.mediumSystemFont(ofSize: 17), .foregroundColor: UIColor.darkText] // 标题
        }
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
        manager.placeholderFont = .systemFont(ofSize: 15)
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

