//
//  UIBezierPath+Circle.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2019/4/2.
//  Copyright © 2020 SimonWong. All rights reserved.
//

extension UIBezierPath {
    
    convenience init(center: CGPoint, radius: CGFloat) {
        self.init(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(.pi * 2.0), clockwise: true)
    }
    
}
