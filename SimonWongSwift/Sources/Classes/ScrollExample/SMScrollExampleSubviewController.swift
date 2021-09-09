//
//  SMScrollExampleSubviewController.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/10/19.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class SMScrollExampleSubviewController: BasePlainTableViewController, DisposeBagProtocol, UITableViewDataSource, UITableViewDelegate {

    var index: Int = 0
    
    private var pageController: SMScrollExamplePageController!
    private var canScroll = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageController = wm_pageController as? SMScrollExamplePageController
        configureTableView()
    }
    
    override func configureTableView() {
        super.configureTableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.snp.remakeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            let navigationBarHeight = navigationController?.navigationBar.height ?? 0
            make.height.equalTo(UIScreenHeight - UIStatusBarHeight - navigationBarHeight - SMScrollExamplePageController.menuViewHeight)
        }
        tableViewBottomEdgeInset = SafeAreaBottomInset
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: .leastNonzeroMagnitude, left: .leastNonzeroMagnitude, bottom: SafeAreaBottomInset, right: .leastNonzeroMagnitude)
    }
    
    override func register() {
        NotificationCenter.default.rx
            .notification(Notification.Name.ScrollExample.didScrollToTop)
            .take(until: self.rx.deallocated)
            .subscribe(onNext: { [weak self] (notification) in
                guard let ws = self else { return }
                let object = notification.object
                if object as? SMScrollExamplePageController != ws.pageController { return }
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
            .disposed(by: disposeBag)
        NotificationCenter.default.rx
            .notification(Notification.Name.ScrollExample.didLeaveTheTop)
            .take(until: self.rx.deallocated)
            .subscribe(onNext: { [weak self] (notification) in
            guard let ws = self else { return }
            let object = notification.object
            if object as? SMScrollExamplePageController != ws.pageController { return }
            ws.canScroll = false
            ws.tableView.showsVerticalScrollIndicator = false
            ws.tableView.contentOffset = .zero
        })
            .disposed(by: disposeBag)
        NotificationCenter.default.rx
            .notification(Notification.Name.ScrollExample.forceAllScrollToTop)
            .take(until: self.rx.deallocated)
            .subscribe(onNext: { [weak self] (notification) in
            guard let ws = self else { return }
            let object = notification.object
            if object as? SMScrollExamplePageController != ws.pageController { return }
            ws.canScroll = false
            ws.tableView.contentOffset = .zero
        })
            .disposed(by: disposeBag)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !canScroll {
            tableView.contentOffset = .zero
        }
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            NotificationCenter.default.post(name: Notification.Name.ScrollExample.didLeaveTheTop, object: pageController, userInfo: ["canScroll": true])
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewCell.reuseIdentifier) as? BaseTableViewCell
        if cell == nil {
            cell = BaseTableViewCell(style: .value1, reuseIdentifier: BaseTableViewCell.reuseIdentifier)
        }
        cell?.textLabel?.text = "Argument \(indexPath.row)"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
