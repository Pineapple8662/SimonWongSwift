//
//  UIView+CustomBorder.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2019/4/11.
//  Copyright © 2019 SimonWong. All rights reserved.
//

extension UIView {
    
    struct MarginType: OptionSet {
        let rawValue: Int
        static let none = MarginType([])
        static let start = MarginType(rawValue: 1 << 0)
        static let end = MarginType(rawValue: 1 << 1)
        static let all: MarginType = [.start, .end]
    }
    
    private enum BorderTag: Int {
        case top = 1111111
        case left = 2222222
        case bottom = 3333333
        case right = 4444444
    }
    
    @discardableResult
    final func addTopBorder(color: UIColor, width: CGFloat, marginType: MarginType = .none, margin: CGFloat = 0) -> UIView {
        removeTopBorder()
        let border = UIView()
        border.backgroundColor = color
        border.isUserInteractionEnabled = false
        border.tag = BorderTag.top.rawValue
        addSubview(border)
        var start: CGFloat = 0
        var end: CGFloat = 0
        if marginType == .start {
            start = margin
        }
        if marginType == .end {
            end = margin
        }
        border.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(start)
            make.right.equalToSuperview().offset(-end)
            make.height.equalTo(1)
        }
        return border
    }
    
    @discardableResult
    final func addLeftBorder(color: UIColor, width: CGFloat, marginType: MarginType = .none, margin: CGFloat = 0) -> UIView {
        removeLeftBorder()
        let border = UIView()
        border.backgroundColor = color
        border.isUserInteractionEnabled = false
        border.tag = BorderTag.left.rawValue
        addSubview(border)
        var start: CGFloat = 0
        var end: CGFloat = 0
        if marginType == .start {
            start = margin
        }
        if marginType == .end {
            end = margin
        }
        border.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(start)
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(-end)
            make.width.equalTo(1)
        }
        return border
    }
    
    @discardableResult
    final func addBottomBorder(color: UIColor, width: CGFloat, marginType: MarginType = .none, margin: CGFloat = 0) -> UIView {
        removeBottomBorder()
        let border = UIView()
        border.backgroundColor = color
        border.isUserInteractionEnabled = false
        border.tag = BorderTag.bottom.rawValue
        addSubview(border)
        var start: CGFloat = 0
        var end: CGFloat = 0
        if marginType == .start {
            start = margin
        }
        if marginType == .end {
            end = margin
        }
        border.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(start)
            make.right.equalToSuperview().offset(-end)
            make.height.equalTo(1)
        }
        return border
    }
    
    @discardableResult
    final func addRightBorder(color: UIColor, width: CGFloat, marginType: MarginType = .none, margin: CGFloat = 0) -> UIView {
        removeRightBorder()
        let border = UIView()
        border.backgroundColor = color
        border.isUserInteractionEnabled = false
        border.tag = BorderTag.right.rawValue
        addSubview(border)
        var start: CGFloat = 0
        var end: CGFloat = 0
        if marginType == .start {
            start = margin
        }
        if marginType == .end {
            end = margin
        }
        border.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(start)
            make.bottom.equalToSuperview().offset(-end)
            make.right.equalToSuperview()
            make.width.equalTo(1)
        }
        return border
    }
    
    final func removeTopBorder() {
        removeBorder(tag: .top)
    }
    
    final func removeLeftBorder() {
        removeBorder(tag: .left)
    }
    
    final func removeBottomBorder() {
        removeBorder(tag: .bottom)
    }
    
    final func removeRightBorder() {
        removeBorder(tag: .right)
    }
    
    private func removeBorder(tag: BorderTag) {
        subviews.filter { $0.tag == tag.rawValue }
            .forEach { $0.removeFromSuperview() }
    }
    
}
