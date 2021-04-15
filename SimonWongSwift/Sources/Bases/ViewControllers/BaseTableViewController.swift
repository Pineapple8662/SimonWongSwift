//
//  BaseTableViewController.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2020/10/20.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class BaseTableViewController: BaseViewController {
    
    var tableViewTopMargin: CGFloat = 0 {
        didSet {
            tableView.snp.updateConstraints { (make) in
                make.top.equalToSuperview().offset(tableViewTopMargin)
            }
        }
    }
    var tableViewBottomMargin: CGFloat = 0 {
        didSet {
            tableView.snp.updateConstraints { (make) in
                make.bottom.equalToSuperview().offset(-tableViewBottomMargin)
            }
        }
    }
    var tableViewTopEdgeInset: CGFloat? {
        didSet {
            guard let tableViewTopEdgeInset = tableViewTopEdgeInset else { return }
            let contentInsets = tableView.contentInset
            tableView.contentOffset = CGPoint(x: .zero, y: -tableViewTopMargin)
            tableView.contentInset = UIEdgeInsets(top: tableViewTopEdgeInset, left: contentInsets.left, bottom: contentInsets.bottom, right: contentInsets.right)
        }
    }
    var tableViewBottomEdgeInset: CGFloat? {
        didSet {
            guard let tableViewBottomEdgeInset = tableViewBottomEdgeInset else { return }
            let contentInset = tableView.contentInset
            tableView.contentInset = UIEdgeInsets(top: contentInset.top, left: contentInset.left, bottom: tableViewBottomEdgeInset, right: contentInset.right)
        }
    }
    var tableView: UITableView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        if !self.isKind(of: BasePlainTableViewController.self) && !self.isKind(of: BaseGroupedTableViewController.self) && !self.isKind(of: BaseInsetGroupedTableViewController.self) {
            fatalError("不允许直接继承BaseTableViewController，请继承BaseTableViewController子类")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = view.backgroundColor
        tableView.separatorColor = .separator
        let selector = #selector(register)
        if responds(to: selector) {
            perform(selector)
        }
    }
    
    @objc func register() { }
    
    func configureTableView() {
        guard let tableView = tableView else { return }
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(tableViewTopMargin)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-tableViewBottomMargin)
        }
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        if tableView.style == .grouped {
            tableView.tableHeaderView = UIView(frame: CGRect(x: .zero, y: .zero, width: .zero, height: CGFloat.leastNonzeroMagnitude))
        }
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: .leastNonzeroMagnitude, left: .zero, bottom: .leastNonzeroMagnitude, right: .zero)
    }
    
}

extension BaseTableViewController {
    
    @discardableResult
    func openRefreshHeaderAndRefreshFooter(target: Any, action: Selector!) -> (MJRefreshStateHeader, MJRefreshAutoStateFooter) {
        let header = openRefreshHeader(target: target, action: action)
        let footer = openRefreshFooter(target: target, action: action)
        return (header, footer)
    }
    
    @discardableResult
    func openRefreshHeader(target: Any, action: Selector!) -> MJRefreshStateHeader {
        let header: MJRefreshStateHeader = MJRefreshStateHeader(refreshingTarget: target, refreshingAction: action)
        header.lastUpdatedTimeLabel?.isHidden = true
        header.stateLabel?.textColor = .lightText
        header.stateLabel?.font = .systemFont(ofSize: 14)
        header.setTitle("下拉刷新", for: .idle)
        header.setTitle("松手刷新", for: .pulling)
        header.setTitle("刷新中", for: .refreshing)
        header.setTitle("即将刷新", for: .willRefresh)
        header.setTitle("没有更多了", for: .noMoreData)
        header.isAutomaticallyChangeAlpha = true
        tableView.mj_header = header
        return header
    }
    
    @discardableResult
    func openRefreshFooter(target: Any, action: Selector!) -> MJRefreshAutoStateFooter {
        let footer: MJRefreshAutoStateFooter = MJRefreshAutoStateFooter(refreshingTarget: target, refreshingAction: action)
        footer.stateLabel?.textColor = .lightText
        footer.stateLabel?.font = .systemFont(ofSize: 14)
        footer.setTitle("上拉加载更多", for: .idle)
        footer.setTitle("松手加载更多", for: .pulling)
        footer.setTitle("加载中...", for: .refreshing)
        footer.setTitle("即将加载", for: .willRefresh)
        footer.setTitle("没有更多了", for: .noMoreData)
        tableView.mj_footer = footer
        return footer
    }
    
}


// MARK: - BasePlainTableViewController

class BasePlainTableViewController: BaseTableViewController {
    
    override func viewDidLoad() {
        tableView = UITableView(frame: .zero, style: .plain)
        super.viewDidLoad()
    }
    
}

// MARK: - BaseGroupedTableViewController

class BaseGroupedTableViewController: BaseTableViewController {
    
    override func viewDidLoad() {
        tableView = UITableView(frame: .zero, style: .grouped)
        super.viewDidLoad()
    }
    
}

class BaseInsetGroupedTableViewController: BaseTableViewController {
    
    override func viewDidLoad() {
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .insetGrouped)
        } else {
            tableView = UITableView(frame: .zero, style: .plain)
        }
        super.viewDidLoad()
    }
    
}
