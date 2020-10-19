//
//  LoginViewModel.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/10/19.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewModel: ViewModelProtocol {
    
    let input: Input
    let output: Output
    
    struct Input {
        let name: AnyObserver<String>
        let validate: AnyObserver<Void>
    }
    
    struct Output {
        let greeting: Driver<String>
    }
    
    private let nameSubject = ReplaySubject<String>.create(bufferSize: 1)
    private let validateSubject = PublishSubject<Void>()
    
    init() {
        let greeting = validateSubject.withLatestFrom(nameSubject).map { (name) in
            return "Hello \(name)!"
        }.asDriver(onErrorJustReturn: ":-(")
        self.output = Output(greeting: greeting)
        self.input = Input(name: nameSubject.asObserver(), validate: validateSubject.asObserver())
    }
    
}
