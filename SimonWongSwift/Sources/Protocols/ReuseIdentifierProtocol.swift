//
//  ReuseIdentifierProtocol.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/7/29.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

protocol ReuseIdentifierProtocol: class { }

extension ReuseIdentifierProtocol {
    
    static var reuseIdentifier: String {
        get {
            return "\(Self.self)ReuseIdentifier"
        }
    }
    static var nib: UINib {
        get {
            return UINib(nibName: "\(Self.self)", bundle: nil)
        }
    }
    
}
