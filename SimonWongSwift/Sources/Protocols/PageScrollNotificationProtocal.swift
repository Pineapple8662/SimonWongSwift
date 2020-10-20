//
//  PageNotificationProtocal.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/10/19.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

protocol PageScrollNotificationProtocal: class {
    
    func registerPrefixString() -> (String)
    
}

private var prefixStringKey: Void?

extension PageScrollNotificationProtocal {
    
    static var prefixString: String! {
        get {
            var prefixString: String? = objc_getAssociatedObject(self, &prefixStringKey) as? String
            if prefixString == nil {
                prefixString = ""
                objc_setAssociatedObject(self, &prefixStringKey, prefixString, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            }
            return prefixString
        }
        set {
            objc_setAssociatedObject(self, &prefixStringKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    static var didScrollDidToTop: Notification.Name {
        get {
            return Notification.Name(rawValue: "\(String(describing: getPrefixString))DidScrollDidToTopNotification")
        }
    }
    
    private static func getPrefixString() -> (String) {
        var prefixString = "\(Self.self)"
        if !self.prefixString.isEmpty {
            prefixString = self.prefixString
        }
        return prefixString
    }
    
}

