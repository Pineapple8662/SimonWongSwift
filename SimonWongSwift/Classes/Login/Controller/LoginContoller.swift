//
//  LoginContoller.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/10/19.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class LoginController: BaseViewController, DisposeBagProtocol {
    
    let vm = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.output.greeting.drive(navigationItem.rx.title).disposed(by: disposeBag)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        vm.input.name.onNext("wtf")
    }
    
}
