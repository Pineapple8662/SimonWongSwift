//
//  UITextView+Adapter.swift
//  ShoppingMall
//
//  Created by SimonWong on 2019/2/28.
//  Copyright © 2019 Guangzhou Tanghe Information Technology Co., Ltd. All rights reserved.
//

import UIKit

extension UITextView {
    
    static func useAdapter() {
        DispatchQueue.once(token: "UITextView+Adapter") {
            if
                let originalMethod = class_getInstanceMethod(Self.self, #selector(Self.init(coder:))),
                let exchangingMethod = class_getInstanceMethod(Self.self, #selector(Self.adapterInit(coder:)))
            {
                method_exchangeImplementations(originalMethod, exchangingMethod)
            }
        }
    }
    
    @objc private func adapterInit(coder aDecoder: NSCoder) -> UITextView {
        let textView = adapterInit(coder: aDecoder)
        if (textView.font == nil) { return textView }
        var fontSize = textView.font!.pointSize
        if UIDevice.iPhoneSeries.screenWidth375 && UIDevice.iPhoneSeries.iPhoneX_or_higher {
            fontSize += FontSizeDecrement.decrement_1
        } else if UIDevice.iPhoneSeries.seriesOfiPhone8 {
            fontSize += FontSizeDecrement.decrement_2
        } else if UIDevice.iPhoneSeries.iPhoneSE_or_lower {
            fontSize += FontSizeDecrement.decrement_3
        }
        textView.font = textView.font!.withSize(fontSize)
        return textView
    }
    
}