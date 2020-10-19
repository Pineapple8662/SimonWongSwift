//
//  UIView+ViewController.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/8/1.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

extension UIView {
    
    var currentViewController: UIViewController? {
        var responder: UIResponder? = self
        while responder != nil {
            responder = responder!.next
            if let currentController = responder as? UIViewController {
                return currentController
            }
        }
        return nil
    }
    
}
