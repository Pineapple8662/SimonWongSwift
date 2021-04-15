//
//  SMScrollExampleRootController.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/10/19.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class SMScrollExampleRootController: BaseViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollContentView: UIView!
    @IBOutlet weak var scrollContentWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollBottomContentView: UIView!
    
    private var pageController: SMScrollExamplePageController!
    private var menuViewTitles = ["Simon", "Scroll", "Example"]
    private var canScroll = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "滚动穿透"
        if UIDevice.simulator {
            OnceOperate.once(key: "SimulatorGGAlert") {
                let alertVC = UIAlertController(title: nil, message: "模拟器可能会感到卡顿，用真机才能看到真正效果", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "好的", style: .default, handler: nil))
                present(alertVC, animated: true, completion: nil)
            }
        }
        // page controller
        pageController = SMScrollExamplePageController(meunViewTitles: menuViewTitles)
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
        register()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollViewDidScroll(scrollView)
    }
    
    private func register() {
        _ = NotificationCenter.default.rx.notification(SMScrollExampleNotification.didLeaveTheTop)
            .take(until: self.rx.deallocated)
            .subscribe(onNext: { [weak self] (notification) in
                guard let ws = self else { return }
                let object = notification.object
                if object as? SMScrollExamplePageController != ws.pageController { return }
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
            NotificationCenter.default.post(name: SMScrollExampleNotification.didScrollToTop, object: pageController, userInfo: ["canScroll": true, "offsetY": (offsetY - maxOffsetY)])
        } else {
            if !canScroll {
                scrollView.contentOffset = CGPoint(x: .zero, y: maxOffsetY)
            }
        }
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        canScroll = true
        scrollView.setContentOffset(.zero, animated: true)
        NotificationCenter.default.post(name: SMScrollExampleNotification.forceAllScrollToTop, object: pageController, userInfo: nil)
    }
    
}
