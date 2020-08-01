//
//  SplitViewController.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/7/29.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    var masterViewController: BaseNavigationController?
    var detailViewController: BaseNavigationController?
    var placeholderViewControllerClass: AnyClass = UIViewController.self
    
    private var maxMasterWidth: CGFloat = 0
    private var isPortrait: Bool {
        get {
            UIApplication.shared.statusBarOrientation.isPortrait
        }
    }
    
    override var delegate: UISplitViewControllerDelegate? {
        get {
            return self
        }
        set {
            super.delegate = self;
        }
    }
    
    convenience init(master: BaseNavigationController, detail: BaseNavigationController) {
        self.init(nibName: nil, bundle: nil)
        masterViewController = master
        detailViewController = detail
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .default
        }
        if keyWindow?.customCurrentViewController().0.navigationController?.navigationBar.barStyle == .default {
            return .default
        } else {
            return .lightContent
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customSeparator0
        guard let masterVC = masterViewController, let detailVC = detailViewController else { return }
        viewControllers = [masterVC, detailVC]
        delegate = self
        preferredDisplayMode = .allVisible
        maxMasterWidth = UIScreenWidth
        if isPortrait {
            toPortraitWidth()
        } else {
            toLandscapeWidth()
        }
    }
    
    // MARK: - Delegate
    
    // MARk: UISplitViewControllerDelegate
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        var subVCs: [UIViewController] = masterViewController!.viewControllers
        if !isPortrait {
            var flag = false
            if let topVC = detailViewController?.topViewController, !topVC.isKind(of: placeholderViewControllerClass) {
                subVCs.append(contentsOf: detailViewController!.viewControllers)
                flag = true
            }
            if flag {
                let placeholderViewController = (placeholderViewControllerClass as? UIViewController.Type)?.init() ?? UIViewController()
                detailViewController?.viewControllers = [placeholderViewController]
                detailViewController?.viewControllers = subVCs
            }
            toPortraitWidth()
        } else {
            if !subVCs.isEmpty {
                subVCs.remove(at: 0)
                masterViewController!.popToRootViewController(animated: false)
                detailViewController?.viewControllers = subVCs
            }
            toLandscapeWidth()
        }
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, showDetail vc: UIViewController, sender: Any?) -> Bool {
        if isPortrait {
            masterViewController?.show(vc, sender: nil)
        } else {
            detailViewController?.viewControllers = [vc]
            if vc.navigationController?.isKind(of: RTContainerNavigationController.self) ?? false {
                let naviVC = vc.navigationController as! RTContainerNavigationController
                naviVC.viewDidLoadHandler = { [weak naviVC] in
                    guard let naviVC = naviVC else { return }
                    naviVC.customNavigationBar.removeBackButton = true
                }
            }
        }
        return true
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    func splitViewControllerSupportedInterfaceOrientations(_ splitViewController: UISplitViewController) -> UIInterfaceOrientationMask {
        if UIDevice.iPadSeries.all {
            return .landscape
        }
        return .portrait
    }
    
    private func toPortraitWidth() {
        preferredPrimaryColumnWidthFraction = 1
        maximumPrimaryColumnWidth = maxMasterWidth
    }

    private func toLandscapeWidth() {
        preferredPrimaryColumnWidthFraction = UIDevelopingWidth
        maximumPrimaryColumnWidth = UIDevelopingWidth
    }

}
