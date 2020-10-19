//
//  String+Random.swift
//  ShoppingMall
//
//  Created by SimonWong on 2019/9/28.
//  Copyright © 2019 Guangzhou Tanghe Information Technology Co., Ltd. All rights reserved.
//

extension String {
    
    static let allRandomCharacters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    static func randomString(length: Int) -> String {
        var randomString = ""
        for _ in 0..<length {
            let index = Int(arc4random_uniform(UInt32(allRandomCharacters.count)))
            randomString.append(allRandomCharacters[allRandomCharacters.index(allRandomCharacters.startIndex, offsetBy: index)])
        }
        return randomString
    }
    
}
