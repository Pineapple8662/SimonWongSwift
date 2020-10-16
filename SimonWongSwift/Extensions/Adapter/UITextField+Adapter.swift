//
//  UITextField+Adapter.swift
//  ShoppingMall
//
//  Created by SimonWong on 2019/2/28.
//  Copyright © 2019 Guangzhou Tanghe Information Technology Co., Ltd. All rights reserved.
//

import UIKit

extension UITextField {
    
    static func useAdapter() {
        DispatchQueue.once(token: "UITextField+Adapter") {
            if
                let originalMethod = class_getInstanceMethod(Self.self, #selector(Self.init(coder:))),
                let exchangingMethod = class_getInstanceMethod(Self.self, #selector(Self.adapterInit(coder:)))
            {            
                method_exchangeImplementations(originalMethod, exchangingMethod)
            }
        }
    }
    
    @objc private func adapterInit(coder aDecoder: NSCoder) -> UITextField {
        let textField = adapterInit(coder: aDecoder)
        if (textField.font == nil) { return textField }
        var fontSize = textField.font!.pointSize
        if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhoneX || UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone12 {
            fontSize += FontSizeDecrement.decrement_1
        } else if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone8 {
            fontSize += FontSizeDecrement.decrement_2
        } else if UIDevice.iPhoneSeries.screenSizeIsLessThanOrEqual_iPhoneSE {
            fontSize += FontSizeDecrement.decrement_3
        }
        textField.font = textField.font!.withSize(fontSize)
        return textField
    }
    
}
