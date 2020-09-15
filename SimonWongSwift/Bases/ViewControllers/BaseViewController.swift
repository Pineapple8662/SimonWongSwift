//
//  BaseViewController.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/7/31.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseNavigationBarProtocol {

    var animView = UIView()
    
    deinit {
        DDLogDebug("\(self): \(#function)")
        StatusBarActivityIndicator.hide()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarMode = .white
        navigationBarTitle = "12345"
        view.backgroundColor = .lightView        

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

}
