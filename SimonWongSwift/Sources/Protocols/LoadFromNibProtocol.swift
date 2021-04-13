//
//  LoadFromNibProtocol.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/7/29.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

protocol LoadFromNibProtocol: class { }

extension LoadFromNibProtocol where Self: UIView {
    
    static func loadFromNib() -> Self {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.first as! Self
    }
    
}
