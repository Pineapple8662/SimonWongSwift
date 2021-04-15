//
//  DraggableMaskView.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2021/4/16.
//  Copyright © 2021 SimonWong. All rights reserved.
//

import UIKit

class DraggableMaskView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        let hitView = super.hitTest(point, with: event)
        
        if(hitView == self){
            
            return nil
            
        }
        
        return hitView
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("current function: \(self), \(#function)")
    }
    
}
