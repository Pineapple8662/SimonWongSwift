//
//  BaseViewController.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/8/1.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

var DefaultBaseNavigationBarBackgroundColor = UIColor.dynamicColor(.white, .hex_282828)
let DefaultBaseNavigationBarTitleLabelTextColor = UIColor.darkText
let DefaultBaseNavigationBarButtonsTintColor = UIColor.darkText

class BaseNavigationBar: UIView {
    
    lazy var backgroundView: UIImageView = {
        let backgroundView = UIImageView()
        backgroundView.backgroundColor = DefaultBaseNavigationBarBackgroundColor;
        return backgroundView
    }()
    var barBackgroundColor: UIColor? {
        didSet {
            backgroundView.backgroundColor = barBackgroundColor
            shadowImageView.isHidden = barBackgroundColor != DefaultBaseNavigationBarBackgroundColor
        }
    }
    lazy var shadowImageView: UIImageView = {
        let shadowImageView = UIImageView()
        shadowImageView.backgroundColor = .dynamicColor(.hex_e9e9e9, .clear)
        return shadowImageView
    }()
    lazy var mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.distribution = .equalSpacing
        return mainStackView
    }()
    lazy var centerStackView: UIStackView = {
        let centerStackView = UIStackView()
        centerStackView.axis = .horizontal
        centerStackView.distribution = .equalSpacing
        centerStackView.spacing = 4
        return centerStackView
    }()
    lazy var leadingStackView: UIStackView = {
        let leadingStackView = UIStackView()
        leadingStackView.axis = .horizontal
        leadingStackView.distribution = .equalSpacing
        leadingStackView.spacing = 4
        return leadingStackView
    }()
    lazy var trailingStackView: UIStackView = {
        let trailingStackView = UIStackView()
        trailingStackView.distribution = .equalSpacing
        trailingStackView.spacing = 4
        return trailingStackView
    }()
    private lazy var indicatorView = UIActivityIndicatorView(style: .white)
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = DefaultBaseNavigationBarTitleLabelTextColor
        titleLabel.font = .boldSystemFont(ofSize: 19)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    private lazy var tempTitle: String = ""
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    var titleLabelColor: UIColor? {
        didSet {
            titleLabel.textColor = titleLabelColor
        }
    }
    var titleLabelFont: UIFont?
    var removeBackButton = false {
        didSet {
//            if removeBackButton {
//                if backButton != nil {
//                    leadingButtons.removeFirst()
//                }
//            }
        }
    }
    var backButton: UIButton?
    private var _leadingButtons: [UIButton]?
    var leadingButtons: [UIButton] {
        get {
//            if _leadingButtons == nil {
                backButton = UIButton.navigationBarButton(imageName: "navigation_back", target: self, action:#selector(didTapBackButton(_:)))
                _leadingButtons = [backButton!]
//            }
            return _leadingButtons!
        }
        set {
            _leadingButtons = newValue
            for subview in leadingStackView.arrangedSubviews {
                leadingStackView.removeArrangedSubview(subview)
            }
            for leadingButton in leadingButtons {
                leadingStackView.addArrangedSubview(leadingButton)
            }
        }
    }
    private var _trailingButtons: [UIButton]?
    var trailingButtons: [UIButton] {
        get {
            return _trailingButtons!
        }
        set {
            _trailingButtons = newValue
            for subview in trailingStackView.arrangedSubviews {
                trailingStackView.removeArrangedSubview(subview)
            }
            for trailingButton in trailingButtons {
                trailingStackView.addArrangedSubview(trailingButton)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        addSubview(shadowImageView)
        shadowImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(1)
        }
        addSubview(mainStackView)
        mainStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(UIStatusBarHeight)
            make.left.equalToSuperview().offset(UISafeAreaLeftRightMargin)
            make.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-UISafeAreaLeftRightMargin)
        }
        mainStackView.addArrangedSubview(leadingStackView)
        mainStackView.addArrangedSubview(centerStackView)
        mainStackView.addArrangedSubview(trailingStackView)
        // 添加标题
        centerStackView.addArrangedSubview(titleLabel)
    }

    @objc private func didTapBackButton(_ sender: UIButton) {
        if currentViewController?.isKind(of: RTContainerNavigationController.self) ?? false {
            let containerNavigationController = currentViewController as! RTContainerNavigationController
            containerNavigationController.popViewController(animated: true)
        }
    }
    
}
