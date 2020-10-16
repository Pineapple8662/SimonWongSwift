//
//  TabBarController.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/8/1.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import CYLTabBarController

class TabBarController: CYLTabBarController {
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        Self.configureAppearance()
        customizeTabBar()
        configureViewControllers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private static func configureAppearance() {
        UITabBar.appearance().backgroundColor = .dynamicColor(.white, .hex_282828)
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage(color: .dynamicColor(.hex_e9e9e9, .clear))
        let normalAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.lightText]
        UITabBarItem.appearance().setTitleTextAttributes(normalAttributes, for: .normal)
        let selectedAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.darkText]
        UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, for: .selected)
    }
    
    private func customizeTabBar() {
        let dic0 = [CYLTabBarItemTitle: "标题",
                    CYLTabBarItemImage: "tabbar_icon_0",
                    CYLTabBarItemSelectedImage: "tabbar_icon_0_selected"]
        let dic1 = [CYLTabBarItemTitle: "标题",
                    CYLTabBarItemImage: "tabbar_icon_1",
                    CYLTabBarItemSelectedImage: "tabbar_icon_1_selected"]
        let dic2 = [CYLTabBarItemTitle: "标题",
                    CYLTabBarItemImage: "tabbar_icon_2",
                    CYLTabBarItemSelectedImage: "tabbar_icon_2_selected"]
        let dic3 = [CYLTabBarItemTitle: "标题",
                    CYLTabBarItemImage: "tabbar_icon_2",
                    CYLTabBarItemSelectedImage: "tabbar_icon_2_selected"]
        let dic4 = [CYLTabBarItemTitle: "标题",
                    CYLTabBarItemImage: "tabbar_icon_3",
                    CYLTabBarItemSelectedImage: "tabbar_icon_3_selected"]
        tabBarItemsAttributes = [dic0, dic1, dic2, dic3, dic4]
    }
    
    private func configureViewControllers() {
        let naviVC0 = RTContainerNavigationController(rootViewController: BaseViewController())
        let naviVC1 = RTContainerNavigationController(rootViewController: BaseViewController())
        let naviVC2 = RTContainerNavigationController(rootViewController: BaseViewController())
        let naviVC3 = RTContainerNavigationController(rootViewController: BaseViewController())
        let naviVC4 = RTContainerNavigationController(rootViewController: BaseViewController())
        viewControllers = [naviVC0, naviVC1, naviVC2, naviVC3, naviVC4];
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightView
        delegate = self
    }
    
}


