//
//  UIWindow+Hierarchy.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/7/31.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import RTRootNavigationController

extension UIWindow {
    
    func customVisibleViewController() -> UIViewController {
        var tempVC = rootViewController
        while tempVC?.preferredContentSize != nil {
            tempVC = tempVC?.presentedViewController
        }
        return tempVC!
    }
    
    func customCurrentViewController() -> (UIViewController, UIViewController?) {
        return findCurrentViewController(viewController: customVisibleViewController())
    }
    
    private func findCurrentViewController(viewController: UIViewController) -> (UIViewController, UIViewController?) {
        var tempVC = viewController
        if !tempVC.isKind(of: SplitViewController.self) && !tempVC.isKind(of: UITabBarController.self) && !tempVC.isKind(of: UINavigationController.self) && !tempVC.isKind(of: RTContainerController.self) {
            return (tempVC, nil)
        }
        while tempVC.isKind(of: SplitViewController.self) {
            if let masterVC = (tempVC as! SplitViewController).masterViewController {
                tempVC = masterVC
            }
            if UIDevice.iPadSeries.all {
                if let detailVC = (tempVC as! SplitViewController).detailViewController {
                    return (tempVC, detailVC)
                }
            }
        }
        while tempVC.isKind(of: UITabBarController.self) {
            tempVC = (tempVC as! UITabBarController).selectedViewController ?? UIViewController()
        }
        while tempVC.isKind(of: UINavigationController.self) {
            tempVC = (tempVC as! UINavigationController).visibleViewController ?? UIViewController()
        }
        while tempVC.isKind(of: RTContainerController.self) {
            tempVC = (tempVC as! RTContainerController).contentViewController
        }
        return findCurrentViewController(viewController: tempVC)
    }
    
    func isNaviTopViewController(_ masterOrDetail : Int = 0) -> Bool {
        var flag = false
        var customCurrentVC: UIViewController? = nil
        if masterOrDetail == 0 {
            customCurrentVC = customCurrentViewController().0
        } else {
            customCurrentVC = customCurrentViewController().1
        }
        if customCurrentVC?.rt_navigationController.isKind(of: BaseNavigationController.self) ?? false {
            let naviVC: BaseNavigationController = customCurrentVC?.rt_navigationController as! BaseNavigationController
            if naviVC.rt_viewControllers.count == 1 {
                flag = true
            }
        }
        return flag
    }
    
}
