//
//  BaseViewController.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/7/31.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseViewProtocol {

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
        view.backgroundColor = .lightView
        navigationItem.title = "标题"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if indicator.isAnimating {
            indicator.startAnimating()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        showLoadingUI()
    }

}
