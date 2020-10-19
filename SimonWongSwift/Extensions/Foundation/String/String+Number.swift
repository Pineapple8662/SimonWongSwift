//
//  String+CGFloat.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2019/4/10.
//  Copyright © 2020 SimonWong. All rights reserved.
//

extension String {
    
    var doubleValue: Double {
        get {
            return Double(self) ?? 0
        }
    }
    var intValue: Int {
        get {
            let double = Double(self)
            return Int(double ?? 0)
        }
    }
    var floatValue: CGFloat {
        get {
            let double = Double(self)
            return CGFloat(double ?? 0)
        }
    }
    
}
