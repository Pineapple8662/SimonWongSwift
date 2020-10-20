//
//  UIScrollView+MultipleScroll.swift
//  ShoppingMall
//
//  Created by SimonWong on 2019/11/15.
//  Copyright © 2019 Guangzhou Tanghe Information Technology Co., Ltd. All rights reserved.
//

private var isMultipleScrollEnabledKey: Void?

extension UIScrollView: UIGestureRecognizerDelegate {
    
    var isMultipleScrollEnabled: Bool {
        get {
            var _isMultipleScrollEnabled: Bool? = objc_getAssociatedObject(self, &isMultipleScrollEnabledKey) as? Bool
            if _isMultipleScrollEnabled == nil {
                _isMultipleScrollEnabled = false
            }
            objc_setAssociatedObject(self, &isMultipleScrollEnabledKey, _isMultipleScrollEnabled, .OBJC_ASSOCIATION_ASSIGN)
            return _isMultipleScrollEnabled!
        }
        set {
            objc_setAssociatedObject(self, &isMultipleScrollEnabledKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    /// 返回true，则可以多个手势一起触发方法，返回false则为互斥
    /// 比如外层scrollView名为mainScroll内嵌的scrollView名为subScroll，当我们拖动subScroll时，mainScroll是不会响应手势的（多个手势默认是互斥的），当下面这个代理返回true时，subScroll和mainScroll就能同时响应手势，同时滚动，这符合我们这里的需求
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if isMultipleScrollEnabled && gestureRecognizer.state != .possible {
            return true
        }
        return false
    }
    
}
