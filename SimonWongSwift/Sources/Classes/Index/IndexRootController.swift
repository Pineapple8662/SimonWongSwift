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
    private var menuViewTitles = ["First", "Second", "Third"]
    private var canScroll = true
    
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
        // register
        register()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollViewDidScroll(scrollView)
    }
    
    private func register() {
        _ = NotificationCenter.default.rx.notification(IndexNotification.didLeaveTheTop)
            .take(until: self.rx.deallocated)
            .subscribe(onNext: { [weak self] (notification) in
                guard let ws = self else { return }
                let object = notification.object
                if object as? IndexPageController != ws.pageController { return }
                guard let userInfo = notification.userInfo else { return }
                let canScroll: Bool = userInfo["canScroll"] as! Bool
                if canScroll {
                    ws.canScroll = canScroll
                }
            })
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
            NotificationCenter.default.post(name: IndexNotification.didScrollToTop, object: pageController, userInfo: ["canScroll": true, "offsetY": (offsetY - maxOffsetY)])
        } else {
            if !canScroll {
                scrollView.contentOffset = CGPoint(x: .zero, y: maxOffsetY)
            }
        }
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        canScroll = true
        scrollView.setContentOffset(.zero, animated: true)
        NotificationCenter.default.post(name: IndexNotification.forceAllScrollToTop, object: pageController, userInfo: nil)
    }
    
}
