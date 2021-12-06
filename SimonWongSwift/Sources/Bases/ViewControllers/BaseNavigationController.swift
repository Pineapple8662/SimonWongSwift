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
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.rt_disableInteractivePop = false
            viewController.navigationItem.hidesBackButton = false
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "navigation_back"), style: .plain, target: self, action: #selector(didTapLeftBarButtonItem))
            viewController.navigationItem.leftBarButtonItem?.tintColor = .darkText
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
