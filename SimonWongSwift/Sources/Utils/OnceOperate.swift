//
//  OnceOperate.swift
//  CHMerchant
//
//  Created by SimonWong on 2020/12/23.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class OnceOperate {

    static func once(key: String, completion: () -> Void) {
        if UserDefaults.standard.object(forKey: key) == nil {
            UserDefaults.standard.setValue(key, forKey: key)
            UserDefaults.standard.synchronize()
            completion()
        }
    }
    
}
