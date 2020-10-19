//
//  CAPropertyAnimation+Key.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2019/4/2.
//  Copyright © 2020 SimonWong. All rights reserved.
//

extension CAPropertyAnimation {
    
    enum Key: String {
        var path: String {
            return rawValue
        }
        case strokeStart = "strokeStart"
        case strokeEnd = "strokeEnd"
        case strokeColor = "strokeColor"
        case rotationZ = "transform.rotation.z"
        case scale = "transform.scale"
    }
    
    convenience init(key: Key) {
        self.init(keyPath: key.path)
    }
    
}
