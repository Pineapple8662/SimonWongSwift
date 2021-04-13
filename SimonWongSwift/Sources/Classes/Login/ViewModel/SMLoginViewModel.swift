//
//  SMLoginViewModel.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/10/19.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit
import RxSwift

class SMLoginViewModel: ViewModelType {
    
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
            return "Output is \(name)"
        }.asDriver(onErrorJustReturn: ":-(")
        self.output = Output(greeting: greeting)
        self.input = Input(name: nameSubject.asObserver(), validate: validateSubject.asObserver())
    }
    
}
