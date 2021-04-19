//
//  IndexController.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2021/4/14.
//  Copyright © 2021 SimonWong. All rights reserved.
//

import UIKit

class SMIndexController: BaseInsetGroupedTableViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var sources: [String] = ["滚动穿透", "弹出窗口(编写中)", "Show Loading", "Show Toast", "Show Success", "Show Error"]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "首页"
        configureTableView()
    }
    
    override func configureTableView() {
        super.configureTableView()
        tableView.dataSource = self
        tableView.delegate = self
        var topEdgeInset: CGFloat = 10
        if #available(iOS 13.0, *) {
            if tableView.style != .insetGrouped {
                topEdgeInset = .zero
            }
        }
        tableViewTopEdgeInset = topEdgeInset
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewCell.reuseIdentifier) as? BaseTableViewCell
        if cell == nil {
            cell = BaseTableViewCell(style: .value1, reuseIdentifier: BaseTableViewCell.reuseIdentifier)
        }
        cell?.accessoryType = .disclosureIndicator
        cell?.textLabel?.text = sources[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let vc = SMScrollExampleRootController()
            if UIDevice.iPadSeries.all {
                showDetailViewController(vc, sender: nil)
            } else {
                navigationController?.pushViewController(vc, animated: true)
            }
        } else if indexPath.row == 1 {
            let vc = SMPopController()
            vc.show()
        } else if indexPath.row == 2 {
            ProgressHUD.show()
            DispatchQueue.after(3) {
                ProgressHUD.dismiss()
            }
        } else if indexPath.row == 3 {
            ProgressHUD.show(message: "This's Toast!!!")
        } else if indexPath.row == 4 {
            ProgressHUD.show(success: "Success")
        } else if indexPath.row == 5 {
            ProgressHUD.show(error: "Error")
        }
    }

}
