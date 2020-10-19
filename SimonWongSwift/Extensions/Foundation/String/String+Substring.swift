//
//  String+Extension.swift
//  ShoppingMall
//
//  Created by SimonWong on 2020/2/17.
//  Copyright © 2020 Guangzhou Tanghe Information Technology Co., Ltd. All rights reserved.
//

extension String {
    
    subscript (i: Int) -> String {
        return self[i..<i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, count)..<count]
    }

    func substring(toIndex: Int) -> String {
        return self[0..<max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(count, r.lowerBound)), upper: min(count, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start..<end])
    }
    
}
