//
//  NewIndexController.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2021/4/14.
//  Copyright © 2021 SimonWong. All rights reserved.
//

import UIKit

class NewIndexController: BasePlainTableViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var sources: [String] = ["滚动穿透", "登录页面", "弹出窗口"]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "首页"
        configureTableView()
    }
    
    override func configureTableView() {
        super.configureTableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableViewTopEdgeInset = 10
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
            
        }
    }

}
