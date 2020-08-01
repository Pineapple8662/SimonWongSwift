//
//  BaseNavigationBarProtocol.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/8/1.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

enum BaseNavigationBarThemeMode {
    case white
}

protocol BaseNavigationBarProtocol: UITraitEnvironment { }

private var navigationBarTitleKey: Void?
private var navigationBarModeKey: Void?
private var navigationBarShadowImageIsHiddenKey: Void?

extension BaseNavigationBarProtocol where Self: UIViewController {
    
    var navigationBar: BaseNavigationBar? {
        get {
            if navigationController?.isKind(of: RTContainerNavigationController.self) ?? false {
                return (navigationController as! RTContainerNavigationController).customNavigationBar
            } else {
                return nil
            }
        }
    }
    var navigationBarTitle: String? {
        get {
            return (objc_getAssociatedObject(self, &navigationBarTitleKey) as? String)!
        }
        set {
            objc_setAssociatedObject(self, &navigationBarTitleKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            navigationBar?.title = newValue ?? ""
        }
    }
    var navigationBarMode: BaseNavigationBarThemeMode {
        get {
            return (objc_getAssociatedObject(self, &navigationBarModeKey) as? BaseNavigationBarThemeMode)!
        }
        set {
            objc_setAssociatedObject(self, &navigationBarModeKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
            switch newValue {
            case .white:
                navigationController?.navigationBar.barStyle = .default
                navigationBar?.barBackgroundColor = DefaultBaseNavigationBarBackgroundColor
                navigationBar?.titleLabelColor = DefaultBaseNavigationBarTitleLabelTextColor
                setNeedsStatusBarAppearanceUpdate()
            }
        }
    }
    var navigationBarShadowImageIsHidden: Bool {
        get {
            return objc_getAssociatedObject(self, &navigationBarShadowImageIsHiddenKey) as! Bool
        }
        set {
            objc_setAssociatedObject(self, &navigationBarShadowImageIsHiddenKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
            navigationBar?.shadowImageView.isHidden = newValue
        }
    }
    
}
