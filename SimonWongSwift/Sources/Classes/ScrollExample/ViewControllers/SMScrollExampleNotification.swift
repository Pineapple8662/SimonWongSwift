//
//  SMScrollExampleNotification.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/10/19.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

extension Notification.Name {
    
    struct ScrollExample {
        static let didScrollToTop = Notification.Name(rawValue: "\(Bundle.identifier).scrollExample.didScrollToTop")
        static let didLeaveTheTop = Notification.Name(rawValue: "\(Bundle.identifier).scrollExample.didLeaveTheTop")
        static let forceAllScrollToTop = Notification.Name(rawValue: "\(Bundle.identifier).scrollExample.forceAllScrollToTop")
        static let reloadData = Notification.Name(rawValue: "\(Bundle.identifier).scrollExample.reloadData")
    }
    
}
