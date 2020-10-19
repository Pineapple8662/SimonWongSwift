//
//  DisposeBagProtocol.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2019/5/31.
//  Copyright © 2020 SimonWong. All rights reserved.
//

protocol DisposeBagProtocol: class { }

private var disposeBagKey: Void?

extension DisposeBagProtocol {
    
    var disposeBag: DisposeBag! {
        get {
            var disposeBag: DisposeBag? = objc_getAssociatedObject(self, &disposeBagKey) as? DisposeBag
            if disposeBag == nil {
                disposeBag = DisposeBag()
                objc_setAssociatedObject(self, &disposeBagKey, disposeBag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return disposeBag!
        }
    }
    
}
