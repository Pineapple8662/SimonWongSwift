//
//  SMScrollExamplePageController.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/10/19.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit
import WMPageController

class SMScrollExamplePageController: WMPageController {
    
    static let menuViewHeight: CGFloat = 45
    
    private var meunViewTitles: [String]?

    convenience init(meunViewTitles: [String]) {
        self.init()
        self.meunViewTitles = meunViewTitles
        self.dataSource = self
        self.delegate = self
        self.menuViewLayoutMode = .left
        self.progressWidth = 24
        self.pageAnimatable = true
        self.titleSizeSelected = 16
        self.titleSizeNormal = 16
        self.titleColorSelected = .darkText
        self.titleColorNormal = .lightText
        self.titleFontName = "PingFangSC-Medium"
        self.progressColor = .darkText
        self.itemsWidths = meunViewTitles.map { (string) -> NSNumber in
            return NSNumber(value: Double(string.calculateWidth(font: .mediumSystemFont(ofSize: 16)) + 24))
        }
        self.menuViewStyle = .line
        self.progressViewBottomSpace = 6
        self.progressViewCornerRadius = 1
        self.menuViewContentMargin = 8
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightView
        menuView?.backgroundColor = .dynamicColor(.white, .hex_282828)
        menuView?.addBottomBorder(color: .separator, width: 0.5)
    }
    
    override func numbersOfChildControllers(in pageController: WMPageController) -> Int {
        return self.meunViewTitles?.count ?? 0
    }
    
    override func pageController(_ pageController: WMPageController, viewControllerAt index: Int) -> UIViewController {
        let vc = SMScrollExampleSubviewController()
        vc.index = index
        return vc
    }
    
    override func menuView(_ menu: WMMenuView!, titleAt index: Int) -> String! {
        return self.meunViewTitles?[index]
    }
    
    override func pageController(_ pageController: WMPageController, preferredFrameFor menuView: WMMenuView) -> CGRect {
        return CGRect(x: .zero, y: .zero, width: self.view.width, height: Self.menuViewHeight)
    }
    
    override func pageController(_ pageController: WMPageController, preferredFrameForContentView contentView: WMScrollView) -> CGRect {
        let originY = Self.menuViewHeight
        return CGRect(x: .zero, y: originY, width: self.view.width, height: self.view.height - originY)
    }

}
