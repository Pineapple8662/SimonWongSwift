//
//  ProgressHUD+Extension.swift
//  ShoppingMall
//
//  Created by SimonWong on 2019/2/19.
//  Copyright © 2019 Guangzhou Tanghe Information Technology Co., Ltd. All rights reserved.
//

import MBProgressHUD

typealias ProgressHUD = MBProgressHUD

extension ProgressHUD {
    
    private static let defaultDuration: TimeInterval = 1.5
    
    private static func configureHUD(to view: UIView) -> ProgressHUD {
        dismiss()
        let finalView = (view == mainWindow ? mainWindow : view) ?? UIView()
        let hud = showAdded(to: finalView, animated: true)
        hud.removeFromSuperViewOnHide = true
        hud.contentColor = .hex_f8f8f7
        hud.animationType = .fade
        hud.margin = 20
        hud.bezelView.layer.masksToBounds = false
        hud.bezelView.layer.shadowColor = UIColor.dynamicColor(.hex_323232, .hex(0x202020)).cgColor
        hud.bezelView.layer.shadowOpacity = 0.7
        hud.bezelView.layer.shadowOffset = .zero
        hud.bezelView.layer.cornerRadius = 15
        hud.bezelView.style = .solidColor
        hud.bezelView.color = .dynamicColor(UIColor.hex_323232.withAlphaComponent(0.85), UIColor.hex(0x202020).withAlphaComponent(0.85))
        hud.label.font = .mediumSystemFont(ofSize: 16)
        hud.label.numberOfLines = 0
        return hud
    }
    
    @discardableResult
    static func show() -> ProgressHUD {
        return show(to: mainWindow ?? UIView())
    }
    
    @discardableResult
    static func show(to view: UIView) -> ProgressHUD {
        let hud = configureHUD(to: view)
        hud.mode = .customView
        let indicator = CustomActivityIndicator()
        indicator.color = hud.label.textColor
        indicator.startAnimating()
        hud.customView = indicator
        return hud
    }
    
    @discardableResult
    static func show(message: String) -> ProgressHUD {
        let hud = show(message: message, view: mainWindow ?? UIView())
        return hud
    }
    
    @discardableResult
    static func show(message: String, duration: TimeInterval = defaultDuration, completion: @escaping () -> Void) -> ProgressHUD {
        let hud = show(message: message, view: mainWindow ?? UIView())
        hud.isUserInteractionEnabled = true
        DispatchQueue.after(duration) {
            DispatchQueue.main.async {
                completion()
            }
        }
        return hud
    }
    
    @discardableResult
    static func show(message: String, duration: TimeInterval = defaultDuration, view: UIView) -> ProgressHUD {
        let hud = show(to: view)
        hud.isUserInteractionEnabled = false
        hud.mode = .text
        hud.margin = 10
        hud.minSize = CGSize(width: 84, height: .zero)
        hud.bezelView.layer.cornerRadius = 10
        hud.label.text = message
        hud.hide(animated: true, afterDelay: duration)
        return hud
    }
    
    @discardableResult
    static func show(success: String, duration: TimeInterval = defaultDuration) -> ProgressHUD {
        let hud = show(message: success, duration: duration, view: mainWindow ?? UIView())
        hud.isUserInteractionEnabled = false
        hud.mode = .customView
        hud.customView = UIImageView(image: UIImage(named: "progress_hud_success"))
        return hud
    }
    
    @discardableResult
    static func show(success: String, duration: TimeInterval = defaultDuration, completion: @escaping () -> Void) -> ProgressHUD {
        let hud = self.show(success: success)
        hud.isUserInteractionEnabled = true
        DispatchQueue.after(duration) {
            DispatchQueue.main.async {
                completion()
            }
        }
        return hud
    }

    @discardableResult
    static func show(error: String, duration: TimeInterval = defaultDuration) -> ProgressHUD {
        let hud = show(message: error, duration: duration, view: mainWindow ?? UIView())
        hud.isUserInteractionEnabled = false
        hud.mode = .customView
        hud.customView = UIImageView(image: UIImage(named: "progress_hud_error"))
        return hud
    }
    
    @discardableResult
    static func show(error: String, duration: TimeInterval = defaultDuration, completion: @escaping () -> Void) -> ProgressHUD {
        let hud = self.show(error: error)
        hud.isUserInteractionEnabled = true
        DispatchQueue.after(duration) {
            completion()
        }
        return hud
    }
    
    @discardableResult
    static func show(progress message: String) -> ProgressHUD {
        let hud = self.show(to: mainWindow ?? UIView())
        hud.isUserInteractionEnabled = true
        hud.mode = .annularDeterminate
        hud.label.text = message
        return hud
    }

    static func dismiss() {
        let windows = UIApplication.shared.windows
        for index in 0..<windows.count {
            hide(for: windows[index], animated: true)
        }
    }
    
    static func dismiss(for view: UIView) {
        hide(for: view, animated: true)
    }
    
}
