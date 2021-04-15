//
//  BaseNavigationController.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/7/29.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit
import RTRootNavigationController

class BaseNavigationController: RTRootNavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UINavigationBar
        // 主题
        navigationBar.barStyle = .default
        // 透明
        navigationBar.isTranslucent = false
        // 按钮颜色
        navigationBar.tintColor = .darkText
        // 背景颜色
        navigationBar.barTintColor = .dynamicColor(.white, .hex_282828)
        // 去除分割线
        navigationBar.shadowImage = UIImage()
        // 标题
        navigationBar.titleTextAttributes = [.font: UIFont.mediumSystemFont(ofSize: 17), .foregroundColor: UIColor.darkText]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.rt_disableInteractivePop = false
            viewController.navigationItem.hidesBackButton = false
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "navigation_back"), style: .plain, target: self, action: #selector(didTapLeftBarButtonItem))
        }
        super.pushViewController(viewController, animated: animated)
        guard let tabBarController = tabBarController else { return }
        var frame: CGRect! = tabBarController.tabBar.frame
        frame.origin.y = UIScreenHeight - frame.size.height
        tabBarController.tabBar.frame = frame
    }
    
    @objc func didTapLeftBarButtonItem() {
        popViewController(animated: true)
    }
    
}
