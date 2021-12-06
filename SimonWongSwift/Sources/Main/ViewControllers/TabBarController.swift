//
//  TabBarController.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/8/1.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit
import CYLTabBarController

class TabBarController: CYLTabBarController {
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        Self.configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private static func configureAppearance() {
        let normalAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.mediumSystemFont(ofSize: 10), .foregroundColor: UIColor.ultraLightText]
        let selectedAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.semiboldSystemFont(ofSize: 10), .foregroundColor: UIColor.darkText]
        let tabBar = UITabBar.appearance()
        let tabBarItem = UITabBarItem.appearance()
        if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = .dynamicColor(.white, .hex_282828)
            appearance.shadowColor = .dynamicColor(UIColor.hex_f3f3f3.withAlphaComponent(0.3), .clear)
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
            appearance.inlineLayoutAppearance.normal.titleTextAttributes = normalAttributes
            appearance.inlineLayoutAppearance.selected.titleTextAttributes = selectedAttributes
            appearance.compactInlineLayoutAppearance.normal.titleTextAttributes = normalAttributes
            appearance.compactInlineLayoutAppearance.selected.titleTextAttributes = selectedAttributes
            tabBar.standardAppearance = appearance
            if #available(iOS 15.0, *) {
                tabBar.scrollEdgeAppearance = appearance
            }
        } else {
            tabBar.backgroundColor = .dynamicColor(.white, .hex_282828)
            tabBar.backgroundImage = UIImage()
            tabBar.shadowImage = UIImage(color: .dynamicColor(UIColor.hex_f3f3f3.withAlphaComponent(0.3), .clear))
            tabBar.unselectedItemTintColor = .ultraLightText
            tabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
            tabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightView
        delegate = self
        customizeTabBar()
        configureViewControllers()
    }
    
    private func customizeTabBar() {
        let dic0 = [CYLTabBarItemTitle: "标题",
                    CYLTabBarItemImage: "ic_tabbar_0",
                    CYLTabBarItemSelectedImage: "ic_tabbar_0_selected"]
        let dic1 = [CYLTabBarItemTitle: "标题",
                    CYLTabBarItemImage: "ic_tabbar_1",
                    CYLTabBarItemSelectedImage: "ic_tabbar_1_selected"]
        let dic2 = [CYLTabBarItemTitle: "标题",
                    CYLTabBarItemImage: "ic_tabbar_2",
                    CYLTabBarItemSelectedImage: "ic_tabbar_2_selected"]
        let dic3 = [CYLTabBarItemTitle: "标题",
                    CYLTabBarItemImage: "ic_tabbar_3",
                    CYLTabBarItemSelectedImage: "ic_tabbar_3_selected"]
        let dic4 = [CYLTabBarItemTitle: "标题",
                    CYLTabBarItemImage: "ic_tabbar_4",
                    CYLTabBarItemSelectedImage: "ic_tabbar_4_selected"]
        tabBarItemsAttributes = [dic0, dic1, dic2, dic3, dic4]
    }
    
    private func configureViewControllers() {
        let naviVC0 = RTContainerNavigationController(rootViewController: SMIndexController())
        let naviVC1 = RTContainerNavigationController(rootViewController: BaseViewController())
        let naviVC2 = RTContainerNavigationController(rootViewController: BaseViewController())
        let naviVC3 = RTContainerNavigationController(rootViewController: BaseViewController())
        let naviVC4 = RTContainerNavigationController(rootViewController: BaseViewController())
        viewControllers = [naviVC0, naviVC1, naviVC2, naviVC3, naviVC4];
    }
    
}


