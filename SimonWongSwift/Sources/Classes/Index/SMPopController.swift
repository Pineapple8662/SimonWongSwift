//
//  SMPopController.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2021/4/15.
//  Copyright © 2021 SimonWong. All rights reserved.
//

import UIKit
import STPopup

class SMPopController: BasePlainTableViewController, UITableViewDataSource, UITableViewDelegate {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
//        self.contentSizeInPopup = CGSize(width: UIScreenWidth - 20 * 2, height: 522)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func present(in viewController: UIViewController) {
        let popupController = STPopupController(rootViewController: self)
        if UIDevice.iPadSeries.all {
            popupController.style = .bottomSheet
        } else {
            popupController.style = .formSheet
        }
        popupController.transitionStyle = .fade
        popupController.navigationBarHidden = true
        popupController.present(in: viewController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func configureTableView() {
        super.configureTableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.becomeFirstResponder()
        openRefreshHeader(target: self, action: #selector(endRefreshing))
    }
    
    @objc func endRefreshing() {
        DispatchQueue.after(2) {
            self.tableView.mj_header?.endRefreshing()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewCell.reuseIdentifier) as? BaseTableViewCell
        if cell == nil {
            cell = BaseTableViewCell(style: .value1, reuseIdentifier: BaseTableViewCell.reuseIdentifier)
        }
        return cell!
    }

}
