//
//  UITextView+Adapter.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2019/2/28.
//  Copyright © 2020 SimonWong. All rights reserved.
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
        if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhoneX || UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone12 {
            fontSize += FontSizeDecrement.decrement_1
        } else if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone8 {
            fontSize += FontSizeDecrement.decrement_2
        } else if UIDevice.iPhoneSeries.screenSizeIsLessThanOrEqual_iPhoneSE {
            fontSize += FontSizeDecrement.decrement_3
        }
        textView.font = textView.font!.withSize(fontSize)
        return textView
    }
    
}
