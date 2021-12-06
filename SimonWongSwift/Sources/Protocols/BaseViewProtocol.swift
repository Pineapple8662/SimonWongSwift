//
//  BaseViewProtocol.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/10/19.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

protocol BaseViewProtocol { }

private var customActivityIndicatorKey: Void?

extension BaseViewProtocol where Self: UIViewController {
    
    var indicator: CustomActivityIndicator {
        get {
            var _indicator: CustomActivityIndicator? = objc_getAssociatedObject(self, &customActivityIndicatorKey) as? CustomActivityIndicator
            if _indicator == nil {
                _indicator = CustomActivityIndicator()
                view.addSubview(_indicator!)
                view.sendSubviewToBack(_indicator!)
                _indicator?.snp.makeConstraints { (make) in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                }
                objc_setAssociatedObject(self, &customActivityIndicatorKey, _indicator, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return _indicator!
        }
        set {
            objc_setAssociatedObject(self, &customActivityIndicatorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func showLoadingUI(offsetHeight: CGFloat = 0) {
        indicator.snp.updateConstraints { (make) in
            make.centerY.equalToSuperview().offset(-(offsetHeight * 0.5))
        }
        indicator.startAnimating()
    }
    
    func hideLoadingUI() {
        indicator.stopAnimating()
    }
    
}
