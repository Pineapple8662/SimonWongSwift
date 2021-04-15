//
//  UIView+GestureRecognizer.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2019/3/27.
//  Copyright © 2019 SimonWong. All rights reserved.
//

typealias GestureRecognizerActionHandler = (_ gestureRecoginzer: UIGestureRecognizer) -> Void

private var tapGestureRecognizerKey: Void?
private var tapGestureRecognizerBlockKey: Void?
private var longPressGestureRecognizerKey: Void?
private var longPressGestureRecognizerBlockKey: Void?

extension UIView {
    
    @discardableResult
    func addTapAction(completionHandler: GestureRecognizerActionHandler?) -> UITapGestureRecognizer {
        var gestureRecognizer = objc_getAssociatedObject(self, &tapGestureRecognizerKey) as? UITapGestureRecognizer
        if gestureRecognizer == nil {
            gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
            addGestureRecognizer(gestureRecognizer!)
            objc_setAssociatedObject(self, &tapGestureRecognizerKey, gestureRecognizer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        objc_setAssociatedObject(self, &tapGestureRecognizerBlockKey, completionHandler, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        return gestureRecognizer!
    }
    
    @objc private func tap(gestureRecognizer: UITapGestureRecognizer) {
        if gestureRecognizer.state == .recognized {
            let completionHandler = objc_getAssociatedObject(self, &tapGestureRecognizerBlockKey) as? GestureRecognizerActionHandler
            if let completionHandler = completionHandler {
                completionHandler(gestureRecognizer)
            }
        }
    }
    
    /// 添加长按手势
    ///
    /// 要记得判断 gestureRecognizer.state
    ///
    /// - Parameter handler: gestureRecognizer
    /// - Returns: gestureRecognizer
    @discardableResult
    func addLongPressAction(completionHandler: GestureRecognizerActionHandler?) -> UILongPressGestureRecognizer {
        var gestureRecognizer = objc_getAssociatedObject(self, &longPressGestureRecognizerKey) as? UILongPressGestureRecognizer
        if gestureRecognizer == nil {
            gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
            addGestureRecognizer(gestureRecognizer!)
            objc_setAssociatedObject(self, &longPressGestureRecognizerKey, gestureRecognizer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        objc_setAssociatedObject(self, &longPressGestureRecognizerBlockKey, completionHandler, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        return gestureRecognizer!
    }
    
    @objc private func longPress(gestureRecognizer: UILongPressGestureRecognizer) {
        let completionHandler = objc_getAssociatedObject(self, &longPressGestureRecognizerBlockKey) as? GestureRecognizerActionHandler
        if let completionHandler = completionHandler {
            completionHandler(gestureRecognizer)
        }
    }
    
}
