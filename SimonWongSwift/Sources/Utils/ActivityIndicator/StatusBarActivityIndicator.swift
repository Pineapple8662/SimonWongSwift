//
//  StatusBarActivityIndicator.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/7/31.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class StatusBarActivityIndicator {
    
    static func show() {
        if #available(iOS 13.0, *) { return }
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    static func hide() {
        if #available(iOS 13.0, *) { return }
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
}
