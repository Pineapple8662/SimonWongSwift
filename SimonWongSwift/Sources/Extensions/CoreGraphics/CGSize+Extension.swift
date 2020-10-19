//
//  CGSize+Min.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2019/4/2.
//  Copyright © 2020 SimonWong. All rights reserved.
//

extension CGSize {
    
    var min: CGFloat {
        return CGFloat.minimum(width, height)
    }
    
    var max: CGFloat {
        return CGFloat.maximum(width, height)
    }
    
}
