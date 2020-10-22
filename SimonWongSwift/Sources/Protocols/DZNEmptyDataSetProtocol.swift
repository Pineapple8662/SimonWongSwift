//
//  DZNEmptyDataSetProtocol.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/10/20.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

protocol DZNEmptyDataSetProtocol: class, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate { }

extension DZNEmptyDataSetProtocol where Self: UIViewController {
    
    // MARK: DZNEmptyDataSetSource
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let title = "没有内容"
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.lightText]
        return NSAttributedString(string: title, attributes: attributes)
    }
    
    // MARK: DZNEmptyDataSetDelegate
    
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
}
