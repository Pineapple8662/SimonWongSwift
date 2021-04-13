//
//  BaseTableViewController.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/10/20.
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
        if !self.isKind(of: BasePlainTableViewController.self) && !self.isKind(of: BaseGroupedTableViewController.self) {
            fatalError("不允许直接继承BaseTableViewController，请继承BaseTableViewController子类")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = view.backgroundColor
        tableView.separatorColor = .customSeparator
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
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: .leastNonzeroMagnitude, left: .leastNonzeroMagnitude, bottom: .leastNonzeroMagnitude, right: .leastNonzeroMagnitude)
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

