//
//  BaseNavigationController.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/7/29.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import RTRootNavigationController

class BaseNavigationController: RTRootNavigationController {

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.rt_disableInteractivePop = false
            viewController.navigationItem.hidesBackButton = false
        } else {
            if viewController.isKind(of: RTContainerController.self), let containerController = viewController as? RTContainerController {
                if let tabBarController = containerController.contentViewController as? UITabBarController {
                    for subViewController in tabBarController.viewControllers! where subViewController.isKind(of: RTContainerNavigationController.self) {
                        let containerNavigationController = subViewController as! RTContainerNavigationController
                        containerNavigationController.customNavigationBar.removeBackButton = true
                    }
                } else {
                    if containerController.contentViewController.isKind(of: RTContainerNavigationController.self) {
                        let containerNavigationController = containerController.contentViewController as! RTContainerNavigationController
                        containerNavigationController.customNavigationBar.removeBackButton = true
                    }
                }
            }
        }
        super.pushViewController(viewController, animated: animated)
        guard let tabBarController = tabBarController else { return }
        var frame: CGRect! = tabBarController.tabBar.frame
        frame.origin.y = UIScreenHeight - frame.size.height
        tabBarController.tabBar.frame = frame
    }
    
}

private var viewDidLoadHandlerKey: Void?
private var customNavigationBarKey: Void?

extension RTContainerNavigationController {
    
    var viewDidLoadHandler: (() -> Void)? {
        get {
            return objc_getAssociatedObject(self, &viewDidLoadHandlerKey) as? (() -> Void)
        }
        set {
            objc_setAssociatedObject(self, &viewDidLoadHandlerKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    var customNavigationBar: BaseNavigationBar {
        get {
            return objc_getAssociatedObject(self, &customNavigationBarKey) as! BaseNavigationBar
        }
        set {
            objc_setAssociatedObject(self, &customNavigationBarKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationBarHidden = true
        customNavigationBar = BaseNavigationBar()
        view.addSubview(customNavigationBar)
        customNavigationBar.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(UINavigationBarHeight)
        }
        if let viewDidLoadHandler = viewDidLoadHandler {
            viewDidLoadHandler()
        }
    }

}
