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
    
    private var maskView: DraggableMaskView = DraggableMaskView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        var width: CGFloat = 0
        var height: CGFloat = 0
        if UIDevice.iPadSeries.all {
            width = UIScreenHeight - 88
            height = width
        } else {
            width = UIDevelopingWidth
            height = UIScreenHeight - UIStatusBarHeight - SafeAreaBottomInset
            height = 400 + SafeAreaBottomInset
        }
        self.contentSizeInPopup = CGSize(width: width, height: height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(in viewController: UIViewController? = mainWindow?.customVisibleViewController()) {
        guard let viewController = viewController else { return }
        let popupController = STPopupController(rootViewController: self)
        if UIDevice.iPadSeries.all {
            popupController.style = .formSheet
        } else {
            popupController.style = .bottomSheet
        }
        popupController.transitionStyle = .slideVertical
        popupController.navigationBarHidden = true
        popupController.present(in: viewController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundView = popupController?.backgroundView {
            backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            backgroundView.isUserInteractionEnabled = true
            backgroundView.addTapAction { [weak self] (gestureRecognizer) in
                guard let ws = self else { return }
                ws.popupController?.dismiss()
            }
        }
        if let containerView = popupController?.containerView {
            if UIDevice.iPadSeries.all {
                containerView.layer.masksToBounds = true
                containerView.layer.cornerRadius = 8
            } else {
                containerView.layer.masksToBounds = true
                let cornerSize = CGSize(width: 8, height: 8)
                let maskPath = UIBezierPath(roundedRect: containerView.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: cornerSize)
                let maskLayer = CAShapeLayer()
                maskLayer.frame = containerView.bounds
                maskLayer.path = maskPath.cgPath
                containerView.layer.mask = maskLayer
            }
        }
        configureTableView()
        if UIDevice.iPhoneSeries.all {
//            if let containerView = popupController?.containerView {
//                view.addSubview(maskView)
//                maskView.snp.makeConstraints { (make) in
//                    make.edges.equalToSuperview()
//                }
//            }
        }
    }
    
    override func configureTableView() {
        super.configureTableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableViewBottomMargin = -SafeAreaBottomInset
        tableViewBottomEdgeInset = SafeAreaBottomInset
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: .leastNonzeroMagnitude, left: .leastNonzeroMagnitude, bottom: SafeAreaBottomInset, right: .leastNonzeroMagnitude)
        openRefreshHeader(target: self, action: #selector(endRefreshing))
    }
    
    @objc func endRefreshing() {
        DispatchQueue.after(2) {
            self.tableView.mj_header?.endRefreshing()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewCell.reuseIdentifier) as? BaseTableViewCell
        if cell == nil {
            cell = BaseTableViewCell(style: .value1, reuseIdentifier: BaseTableViewCell.reuseIdentifier)
        }
        return cell!
    }

}
