//
//  CustomActivityIndicator.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2019/4/2.
//  Copyright © 2020 SimonWong. All rights reserved.
//

// https://github.com/nspavlo/MaterialActivityIndicator

@IBDesignable
class CustomActivityIndicator: UIView {
    
    @IBInspectable
    var color: UIColor = .dynamicColor(.hex(0xe3e3e3), .hex_969696) {
        didSet {
            indicator.strokeColor = color.cgColor
        }
    }
    @IBInspectable
    var lineWidth: CGFloat = 3 {
        didSet {
            indicator.lineWidth = lineWidth
            setNeedsLayout()
        }
    }
    var isAnimating = false
    
    private let animator = CustomActivityIndicatorAnimator()
    
    private var indicator = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureSubviews()
    }
    
    private func configureSubviews() {
        _ = NotificationCenter.default.rx
            .notification(UIApplication.willEnterForegroundNotification)
            .take(until: self.rx.deallocated)
            .subscribe(onNext: { [weak self] _ in
                guard let ws = self else { return }
                ws.willEnterForeground()
            })
        indicator.strokeColor = color.cgColor
        indicator.fillColor = nil
        indicator.lineWidth = lineWidth
        indicator.strokeStart = 0
        indicator.strokeEnd = 0
        layer.addSublayer(indicator)
    }
    
    private func willEnterForeground() {
        if isAnimating {
            startAnimating()
        }
    }
    
}

extension CustomActivityIndicator {
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 40, height: 40)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        indicator.frame = bounds
        let diameter = bounds.size.min - indicator.lineWidth
        let path = UIBezierPath(center: bounds.center, radius: diameter / 2)
        indicator.path = path.cgPath
    }
    
}

extension CustomActivityIndicator {
    
    func startAnimating() {
        animator.addAnimation(to: indicator)
        isAnimating = true
    }
    
    func stopAnimating() {
        animator.removeAnimation(from: indicator)
        isAnimating = false
    }
    
}
