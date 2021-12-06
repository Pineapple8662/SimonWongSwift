//
//  AppDelegate+Fade.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/7/29.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    func fade() {
        if let window = window {
            let launchScreenVC = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateViewController(withIdentifier: "LaunchScreen")
            if let launchView = launchScreenVC.view {
                window.addSubview(launchView)
                UIView.animate(withDuration: 0.5, delay: .zero, options: .curveEaseIn, animations: {
                    launchView.alpha = 0
                }) { (finished) in
                    launchView.removeFromSuperview()
                }
            }
        }
    }
    
}
