//
//  UIButton+BaseNavigationBar.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/8/1.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

extension UIButton {
    
    /// BaseNavigationBar - title
    static func navigationBarButton(type: UIButton.ButtonType = .system, title: String, target: Any?, action: Selector) -> UIButton {
        let button = UIButton(type: type)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .mediumSystemFont(ofSize: 16)
        button.addTarget(target, action: action, for: .touchUpInside)
        return button
    }

    /// BaseNavigationBar - image
    static func navigationBarButton(type: UIButton.ButtonType = .system, imageName: String, target: Any?, action: Selector) -> UIButton {
        let button = UIButton(type: type)
        button.setImage(UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.titleLabel?.font = .mediumSystemFont(ofSize: 16)
        button.addTarget(target, action: action, for: .touchUpInside)
        return button
    }
    
}
