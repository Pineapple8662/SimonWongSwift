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
        navigationBarTitle = "我是标题"
        view.backgroundColor = .lightView
        
        let btn0 = UIButton(type: .system)
        btn0.setTitle("按钮", for: .normal)
        navigationBar?.leadingButtons = [btn0]        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("UIScreenWidth: \(UIScreenWidth)")
        print("UIScreenHeight: \(UIScreenHeight)")
        print("UIScreen.main.scale: \(UIScreen.main.scale)")
    }

}
