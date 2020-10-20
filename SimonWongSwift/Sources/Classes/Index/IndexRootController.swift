//
//  IndexRootController.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/10/19.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class IndexRootController: BaseViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollContentView: UIView!
    @IBOutlet weak var scrollContentWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollBottomContentView: UIView!
    
    private var pageController: IndexPageController!
    private var menuViewTitles = ["第一", "第二", "第三"]
    private var canScroll = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Index"
        // page controller
        pageController = IndexPageController(meunViewTitles: menuViewTitles)
        addChild(pageController)
        scrollBottomContentView.addSubview(pageController.view)
        pageController.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        // scroll view
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.isMultipleScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
        scrollContentWidthConstraint.constant = UIDevelopingWidth
        // registerHandler
        registerHandler()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollViewDidScroll(scrollView)
    }
    
    private func registerHandler() {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView != self.scrollView {
            return
        }
        let maxOffsetY = scrollBottomContentView.top
        let offsetY = scrollView.contentOffset.y
        if offsetY >= maxOffsetY {
            canScroll = false
            scrollView.contentOffset = CGPoint(x: .zero, y: maxOffsetY)
            NotificationCenter.default.post(name: IndexConst.didScrollDidToTop, object: self.pageController, userInfo: ["canScroll":true, "offsetY":(offsetY - maxOffsetY)])
        }
    }
    
}
