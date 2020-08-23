//
//  DispatchQueue+Once.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/8/1.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

extension DispatchQueue {
    
    private static var onceTracker = [String]()
    
    static func once(token: String, completion: () -> Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        if onceTracker.contains(token) { return }
        onceTracker.append(token)
        completion()
    }
    
}
