//
//  DispatchQueue+After.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/8/1.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

extension DispatchQueue {
    
    @discardableResult
    static func after(_ delay: TimeInterval, execute closure: @escaping @convention(block) () -> Void) -> DispatchWorkItem {
        let item = DispatchWorkItem(block: closure)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: closure)
        return item
    }
    
}
