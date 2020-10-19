//
//  LoginContoller.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/10/19.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class LoginController: BaseViewController, DisposeBagProtocol {
    
    private let vm = LoginViewModel()
    
    private var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "登录"
        
        label.text = "Say something."
        label.textColor = .random
        label.font = .mediumSystemFont(ofSize: 14)
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.center.equalTo(self.indicator)
        }
        
        vm.output.greeting.drive(label.rx.text).disposed(by: disposeBag)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        showLoadingUI()
//        let inputs = LoginViewModel.Input(name: 😱😱, validate: 😱😱)
        
        vm.input.name.onNext("wtf")
//        vm.input.validate.onNext(Void)
        
    }
    
}
