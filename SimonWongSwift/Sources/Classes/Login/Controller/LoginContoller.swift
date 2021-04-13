//
//  LoginContoller.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/10/19.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class SMLoginController: BaseViewController, DisposeBagProtocol {
    
    private let vm = SMLoginViewModel()
    
    private var textField = UITextField()
    private var button = UIButton(type: .system)
    private var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "登录"
        
        button.setTitle("确认", for: .normal)
        button.titleLabel?.font = .mediumSystemFont(ofSize: 16)
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalTo(self.indicator)
        }
        
        textField.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        textField.layer.cornerRadius = 8
        textField.textColor = .darkText
        textField.font = .mediumSystemFont(ofSize: 14)
        textField.textAlignment = .center
        view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.bottom.equalTo(button.snp.top).offset(-24)
            make.centerX.equalTo(button)
            make.width.equalTo(180)
            make.height.equalTo(45)
        }
        
        label.text = "Say something."
        label.textColor = .darkText
        label.font = .mediumSystemFont(ofSize: 14)
        label.textAlignment = .center
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(button.snp.bottom).offset(24)
            make.centerX.equalTo(button)
            make.width.equalTo(300)
        }
        
        button.rx.tap.bind(to: vm.input.validate).disposed(by: disposeBag)
        textField.rx.text.orEmpty.bind(to: vm.input.name).disposed(by: disposeBag)
        vm.output.greeting.drive(label.rx.text).disposed(by: disposeBag)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(tabBarController?.tabBar.height ?? 0)
    }
    
}
