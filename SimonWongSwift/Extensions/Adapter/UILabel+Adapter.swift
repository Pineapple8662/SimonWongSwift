//
//  UILabel+Adapter.swift
//  ShoppingMall
//
//  Created by SimonWong on 2019/2/21.
//  Copyright © 2019 Guangzhou Tanghe Information Technology Co., Ltd. All rights reserved.
//

import UIKit

extension UILabel {
    
    static func useAdapter() {
        DispatchQueue.once(token: "UILabel+Adapter") {
            if
                let originalMethod = class_getInstanceMethod(Self.self, #selector(Self.init(coder:))),
                let exchangingMethod = class_getInstanceMethod(Self.self, #selector(Self.adapterInit(coder:)))
            {
                method_exchangeImplementations(originalMethod, exchangingMethod)
            }
        }
    }
    
    @objc private func adapterInit(coder aDecoder: NSCoder) -> UILabel {
        let label = adapterInit(coder: aDecoder)
        var fontSize = label.font.pointSize
        if UIDevice.iPhoneSeries.screenSizeIsGreaterThanOrEqual_iPhoneX {
            fontSize += FontSizeDecrement.decrement_1
        } else if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone8 {
            fontSize += FontSizeDecrement.decrement_2
        } else if UIDevice.iPhoneSeries.screenSizeIsLessThanOrEqual_iPhoneSE {
            fontSize += FontSizeDecrement.decrement_3
        }
        label.font = label.font.withSize(fontSize)
        return label
    }
    
}
