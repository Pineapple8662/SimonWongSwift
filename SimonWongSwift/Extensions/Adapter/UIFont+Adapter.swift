//
//  UIFont+Adapter.swift
//  ShoppingMall
//
//  Created by SimonWong on 2019/2/21.
//  Copyright © 2019 Guangzhou Tanghe Information Technology Co., Ltd. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func useAdapter() {
        DispatchQueue.once(token: "UIFont+Adapter") {
            do {
                if
                    let originalMethod = class_getClassMethod(Self.self, #selector(Self.systemFont(ofSize:))),
                    let exchangingMethod = class_getClassMethod(Self.self, #selector(Self.adapterSystemFont(ofSize:)))
                {
                    method_exchangeImplementations(originalMethod, exchangingMethod)
                }
            }
            do {
                if
                    let originalMethod = class_getClassMethod(Self.self, #selector(Self.boldSystemFont(ofSize:))),
                    let exchangingMethod = class_getClassMethod(Self.self, #selector(Self.adapterBoldSystemFont(ofSize:)))
                {
                    method_exchangeImplementations(originalMethod, exchangingMethod)
                }
            }
            do {
                if
                    let originalMethod = class_getClassMethod(Self.self, #selector(Self.italicSystemFont(ofSize:))),
                    let exchangingMethod = class_getClassMethod(Self.self, #selector(Self.adapterItalicSystemFont(ofSize:)))
                {
                    method_exchangeImplementations(originalMethod, exchangingMethod)
                }
            }
            do {
                if
                    let originalMethod = class_getClassMethod(Self.self, #selector(Self.systemFont(ofSize:weight:))),
                    let exchangingMethod = class_getClassMethod(Self.self, #selector(Self.adapterSystemFont(ofSize:weight:)))
                {
                    method_exchangeImplementations(originalMethod, exchangingMethod)
                }
            }
            do {
                if
                    let originalMethod = class_getClassMethod(Self.self, #selector(Self.monospacedDigitSystemFont(ofSize:weight:))),
                    let exchangingMethod = class_getClassMethod(Self.self, #selector(Self.adapterMonospacedDigitSystemFont(ofSize:weight:)))
                {
                    method_exchangeImplementations(originalMethod, exchangingMethod)
                }
            }
            do {
                if
                    let originalMethod = class_getClassMethod(Self.self, #selector(Self.init(name:size:))),
                    let exchangingMethod = class_getClassMethod(Self.self, #selector(Self.adapterInit(name:size:)))
                {
                    method_exchangeImplementations(originalMethod, exchangingMethod)
                }
            }
        }
    }
    
    @objc private class func adapterSystemFont(ofSize fontSize: CGFloat) -> UIFont {
        var newFont: UIFont?
        if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhoneX || UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone12 {
            newFont = UIFont.adapterSystemFont(ofSize: fontSize + FontSizeDecrement.decrement_1)
        } else if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone8 {
            newFont = UIFont.adapterSystemFont(ofSize: fontSize + FontSizeDecrement.decrement_2)
        } else if UIDevice.iPhoneSeries.screenSizeIsLessThanOrEqual_iPhoneSE {
            newFont = UIFont.adapterSystemFont(ofSize: fontSize + FontSizeDecrement.decrement_3)
        } else {
            newFont = UIFont.adapterSystemFont(ofSize: fontSize)
        }
        return newFont!
    }
    
    @objc private class func adapterBoldSystemFont(ofSize fontSize: CGFloat) -> UIFont {
        var newFont: UIFont?
        if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhoneX || UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone12 {
            newFont = UIFont.adapterBoldSystemFont(ofSize: fontSize + FontSizeDecrement.decrement_1)
        } else if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone8 {
            newFont = UIFont.adapterBoldSystemFont(ofSize: fontSize + FontSizeDecrement.decrement_2)
        } else if UIDevice.iPhoneSeries.screenSizeIsLessThanOrEqual_iPhoneSE {
            newFont = UIFont.adapterBoldSystemFont(ofSize: fontSize + FontSizeDecrement.decrement_3)
        } else {
            newFont = UIFont.adapterBoldSystemFont(ofSize: fontSize)
        }
        return newFont!
    }
    
    @objc private class func adapterItalicSystemFont(ofSize fontSize: CGFloat) -> UIFont {
        var newFont: UIFont?
        if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhoneX || UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone12 {
            newFont = UIFont.adapterItalicSystemFont(ofSize: fontSize + FontSizeDecrement.decrement_1)
        } else if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone8 {
            newFont = UIFont.adapterItalicSystemFont(ofSize: fontSize + FontSizeDecrement.decrement_2)
        } else if UIDevice.iPhoneSeries.screenSizeIsLessThanOrEqual_iPhoneSE {
            newFont = UIFont.adapterItalicSystemFont(ofSize: fontSize + FontSizeDecrement.decrement_3)
        } else {
            newFont = UIFont.adapterItalicSystemFont(ofSize: fontSize)
        }
        return newFont!
    }
    
    @objc private class func adapterSystemFont(ofSize fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        var newFont: UIFont?
        if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhoneX || UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone12 {
            newFont = UIFont.adapterSystemFont(ofSize: fontSize + FontSizeDecrement.decrement_1, weight: weight)
        } else if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone8 {
            newFont = UIFont.adapterSystemFont(ofSize: fontSize + FontSizeDecrement.decrement_2, weight: weight)
        } else if UIDevice.iPhoneSeries.screenSizeIsLessThanOrEqual_iPhoneSE {
            newFont = UIFont.adapterSystemFont(ofSize: fontSize + FontSizeDecrement.decrement_3, weight: weight)
        } else {
            newFont = UIFont.adapterSystemFont(ofSize: fontSize, weight: weight)
        }
        return newFont!
    }
    
    @objc private class func adapterMonospacedDigitSystemFont(ofSize fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        var newFont: UIFont?
        if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhoneX || UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone12 {
            newFont = UIFont.adapterMonospacedDigitSystemFont(ofSize: fontSize + FontSizeDecrement.decrement_1, weight: weight)
        } else if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone8 {
            newFont = UIFont.adapterMonospacedDigitSystemFont(ofSize: fontSize + FontSizeDecrement.decrement_2, weight: weight)
        } else if UIDevice.iPhoneSeries.screenSizeIsLessThanOrEqual_iPhoneSE {
            newFont = UIFont.adapterMonospacedDigitSystemFont(ofSize: fontSize + FontSizeDecrement.decrement_3, weight: weight)
        } else {
            newFont = UIFont.adapterMonospacedDigitSystemFont(ofSize: fontSize, weight: weight)
        }
        return newFont!
    }
    
    @objc private class func adapterInit(name fontName: String, size fontSize: CGFloat) -> UIFont {
        var newFont: UIFont?
        if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhoneX || UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone12 {
            newFont = UIFont.adapterInit(name: fontName, size: fontSize + FontSizeDecrement.decrement_1)
        } else if UIDevice.iPhoneSeries.screenSizeIsEqual_iPhone8 {
            newFont = UIFont.adapterInit(name: fontName, size: fontSize + FontSizeDecrement.decrement_2)
        } else if UIDevice.iPhoneSeries.screenSizeIsLessThanOrEqual_iPhoneSE {
            newFont = UIFont.adapterInit(name: fontName, size: fontSize + FontSizeDecrement.decrement_3)
        } else {
            newFont = UIFont.adapterInit(name: fontName, size: fontSize)
        }
        return newFont!
    }
    
}
