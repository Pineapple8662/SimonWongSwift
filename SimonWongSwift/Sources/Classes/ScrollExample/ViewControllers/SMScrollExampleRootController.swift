//
//  SMScrollExampleRootController.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/10/19.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class SMScrollExampleRootController: BaseViewController, DisposeBagProtocol {

    private(set) var canScroll = true
    
    private var scrollView = UIScrollView()
    private var scrollContentView = UIView()
    private var scrollTopContentView = SMScrollExampleScrollTopContentView()
    private var scrollBottomContentView = UIView()
    private var pageController: SMScrollExamplePageController!
    private var menuViewTitles = ["Scroll", "Example", "Scroll", "Example", "Scroll", "Example", "Scroll", "Example"]
    
    private var rightItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "滚动穿透"
        var rightItemTitle = "穿透已关"
        if UserDefaults.standard.bool(forKey: "开启穿透") {
            rightItemTitle = "穿透已开"
        } else {
            rightItemTitle = "穿透已关"
        }
        rightItem = UIBarButtonItem(title: rightItemTitle, style: .plain, target: self, action: #selector(onTapRightItem))
        let normalAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.mediumSystemFont(ofSize: 16), .foregroundColor: UIColor.darkText]
        let selectedAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.mediumSystemFont(ofSize: 16), .foregroundColor: UIColor.placeholder]
        rightItem.setTitleTextAttributes(normalAttributes, for: .normal)
        rightItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        navigationItem.rightBarButtonItem = rightItem
        if UIDevice.simulator {
            OnceOperate.once(key: "SimulatorGGAlert") {
                let alertVC = UIAlertController(title: "提示", message: "模拟器可能会感到卡顿，用真机才能看到真正效果", preferredStyle: .alert)
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
        // scrollView
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isMultipleScrollEnabled = true
        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(navigationBarHeight)
            make.leading.bottom.trailing.equalToSuperview()
        }
        scrollContentView.backgroundColor = .clear
        scrollView.addSubview(scrollContentView)
        scrollContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(self.view)
        }
        scrollContentView.addSubview(scrollTopContentView)
        scrollTopContentView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        scrollBottomContentView.backgroundColor = .clear
        scrollContentView.addSubview(scrollBottomContentView)
        scrollBottomContentView.snp.makeConstraints { make in
            make.top.equalTo(scrollTopContentView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1000)
        }
        // pageController
        pageController = SMScrollExamplePageController(meunViewTitles: menuViewTitles)
        addChild(pageController)
        scrollBottomContentView.addSubview(pageController.view)
        pageController.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        register()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollViewDidScroll(scrollView)
    }
    
    private func register() {
        NotificationCenter.default.rx.notification(Notification.Name.ScrollExample.didLeaveTheTop)
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
            .disposed(by: disposeBag)
    }
    
}

// MARK: - Actions

extension SMScrollExampleRootController {
    
    @objc private func onTapRightItem() {
        if UserDefaults.standard.bool(forKey: "开启穿透") {
            ProgressHUD.show(message: "已关闭穿透")
            rightItem.title = "穿透已关"
            UserDefaults.standard.set(false, forKey: "开启穿透")
            UserDefaults.standard.synchronize()
        } else {
            ProgressHUD.show(message: "已开启穿透，滚动颜色块查看穿透效果")
            rightItem.title = "穿透已开"
            UserDefaults.standard.set(true, forKey: "开启穿透")
            UserDefaults.standard.synchronize()
        }
    }
    
}

// MARK: - Delegates

// MARK: UIScrollViewDelegate

extension SMScrollExampleRootController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView != self.scrollView {
            return
        }
        let maxOffsetY = scrollBottomContentView.top
        let offsetY = scrollView.contentOffset.y
        if offsetY > maxOffsetY {
            canScroll = false
            scrollView.contentOffset = CGPoint(x: .zero, y: maxOffsetY)
            NotificationCenter.default.post(name: Notification.Name.ScrollExample.didScrollToTop, object: pageController, userInfo: ["canScroll": true, "offsetY": (offsetY - maxOffsetY)])
        } else {
            if !canScroll {
                scrollView.contentOffset = CGPoint(x: .zero, y: maxOffsetY)
            }
        }
    }
    
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        canScroll = true
        scrollView.setContentOffset(.zero, animated: true)
        NotificationCenter.default.post(name: Notification.Name.ScrollExample.forceAllScrollToTop, object: pageController, userInfo: nil)
        return true
    }
    
}
