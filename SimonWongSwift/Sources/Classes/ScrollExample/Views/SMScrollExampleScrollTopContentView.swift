//
//  SMScrollExampleScrollTopContentView.swift
//  SimonWongSwift
//
//  Created by apple on 2021/12/6.
//  Copyright © 2021 SimonWong. All rights reserved.
//

import Foundation
import UIKit

class SMScrollExampleScrollTopContentView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuraSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuraSubviews() {
        backgroundColor = .random
        // 直接约束高度
        snp.makeConstraints { make in
            make.height.equalTo(200)
        }
        // or 子视图撑开高度
    }
    
}
