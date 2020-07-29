//
//  AppDelegate.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/7/24.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static let shared: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // window
        window = UIWindow(frame: UIScreenBounds)
        window?.backgroundColor = .black
        // 设置根视图
        let tabBarVC = UITabBarController()
//        let rootVC =
        window?.rootViewController = tabBarVC
        // makeKeyAndVisible
        window?.makeKeyAndVisible()
        // 渐变动画
        fade()
        return true
    }

}

