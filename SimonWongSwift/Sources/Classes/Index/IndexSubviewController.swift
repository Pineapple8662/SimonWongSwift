//
//  IndexSubviewController.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/10/19.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class IndexSubviewController: BasePlainTableViewController {

    private var pageController: IndexPageController!
    private var canScroll = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .random
        pageController = wm_pageController as? IndexPageController
        configureTableView()
    }
    
    override func configureTableView() {
        super.configureTableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.snp.remakeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(UIScreenHeight - IndexPageController.menuViewHeight)
        }
    }
    
    override func register() {
        _ = NotificationCenter.default.rx.notification(IndexNotification.didScrollToTop)
            .take(until: self.rx.deallocated)
            .subscribe(onNext: { [weak self] (notification) in
                guard let ws = self else { return }
                let object = notification.object
                if object as? IndexPageController != ws.pageController { return }
                guard let userInfo = notification.userInfo else { return }
                let canScroll: Bool = userInfo["canScroll"] as! Bool
                if canScroll {
                    ws.canScroll = canScroll
                    let vc = ws.pageController.currentViewController
                    if vc != self { return }
                    ws.tableView.showsVerticalScrollIndicator = true
                    let offsetY = userInfo["offsetY"] as! CGFloat
                    if ws.tableView.contentOffset.y < ws.tableView.contentSize.height - ws.tableView.height {
                        let newOffsetY = ws.tableView.contentOffset.y + offsetY
                        ws.tableView.contentOffset = CGPoint(x: .zero, y: newOffsetY)
                    }
                }
            })
        _ = NotificationCenter.default.rx.notification(IndexNotification.didLeaveTheTop).take(until: self.rx.deallocated).subscribe(onNext: { [weak self] (notification) in
            guard let ws = self else { return }
            let object = notification.object
            if object as? IndexPageController != ws.pageController { return }
            ws.canScroll = false
            ws.tableView.showsVerticalScrollIndicator = false
            ws.tableView.contentOffset = .zero
        })
        _ = NotificationCenter.default.rx.notification(IndexNotification.forceAllScrollToTop).take(until: self.rx.deallocated).subscribe(onNext: { [weak self] (notification) in
            guard let ws = self else { return }
            let object = notification.object
            if object as? IndexPageController != ws.pageController { return }
            ws.canScroll = false
            ws.tableView.contentOffset = .zero
        })
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !canScroll {
            tableView.contentOffset = .zero
        }
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            NotificationCenter.default.post(name: IndexNotification.didLeaveTheTop, object: pageController, userInfo: ["canScroll": true])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

}
