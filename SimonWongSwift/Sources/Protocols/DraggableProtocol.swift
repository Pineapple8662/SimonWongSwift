//
//  DraggableProtocol.swift
//
//  Created by SimonWong on 2021/12/7.
//

import Foundation
import UIKit

protocol DraggableProtocol { }

@objc protocol DraggableDelegate {
    
    @objc optional func draggable(didBegan offsetPoint: CGPoint)
    @objc optional func draggable(didMove offsetPoint: CGPoint)
    @objc optional func draggable(didEnd offsetPoint: CGPoint)
    
}

private var draggableKey: Void?
private var panGestureRecognizerKey: Void?
private var panGestureRecognizerHandlerKey: Void?
private var draggableDelegateKey: Void?

extension DraggableProtocol where Self: UIView {
    
    var draggable: Bool {
        get {
            var _draggable = objc_getAssociatedObject(self, &draggableKey) as? Bool
            if _draggable == nil {
                _draggable = false
                objc_setAssociatedObject(self, &draggableKey, _draggable, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return _draggable!
        }
        set {
            if newValue {
                if let panGestureRecognizer = panGestureRecognizer {
                    removeGestureRecognizer(panGestureRecognizer)
                }
                panGestureRecognizer = UIPanGestureRecognizer(target: panGestureRecognizerHandler, action: #selector(panGestureRecognizerHandler?.pan(_:)))
                panGestureRecognizer?.minimumNumberOfTouches = 1
                panGestureRecognizer?.maximumNumberOfTouches = 1
                if let panGestureRecognizer = panGestureRecognizer {
                    addGestureRecognizer(panGestureRecognizer)
                }
            }
            objc_setAssociatedObject(self, &draggableKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    weak var draggableDelegate: DraggableDelegate? {
        get {
            return objc_getAssociatedObject(self, &draggableDelegateKey) as? DraggableDelegate
        }
        set {
            objc_setAssociatedObject(self, &draggableDelegateKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    private var panGestureRecognizer: UIPanGestureRecognizer? {
        get {
            let panGestureRecognizer = objc_getAssociatedObject(self, &panGestureRecognizerKey) as? UIPanGestureRecognizer
            return panGestureRecognizer
        }
        set {
            objc_setAssociatedObject(self, &panGestureRecognizerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    private var panGestureRecognizerHandler: PanGestureRecognizerHandler? {
        get {
            var _panGestureRecognizerHandler = objc_getAssociatedObject(self, &panGestureRecognizerHandlerKey) as? PanGestureRecognizerHandler
            if _panGestureRecognizerHandler == nil {
                _panGestureRecognizerHandler = PanGestureRecognizerHandler(source: self) { [weak self] panGestureRecognizer in
                    guard let ws = self else { return }
                    let point = panGestureRecognizer.translation(in: panGestureRecognizer.view)
                    print("offsetPoint: \(point)")
                    switch panGestureRecognizer.state {
                    case .began:
                        ws.draggableDelegate?.draggable?(didBegan: point)
                    case .possible:
                        break
                    case .changed:
                        ws.draggableDelegate?.draggable?(didMove: point)
                    case .ended:
                        ws.draggableDelegate?.draggable?(didEnd: point)
                    case .cancelled:
                        ws.draggableDelegate?.draggable?(didEnd: point)
                    case .failed:
                        break
                    @unknown default:
                        break
                        
                    }
                }
                objc_setAssociatedObject(self, &panGestureRecognizerHandlerKey, _panGestureRecognizerHandler, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return _panGestureRecognizerHandler!
        }
        set {
            objc_setAssociatedObject(self, &panGestureRecognizerHandlerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
}

class PanGestureRecognizerHandler {
    
    private let source: DraggableProtocol
    private let panHandler: ((_ panGestureRecognizer: UIPanGestureRecognizer) -> Void)
    
    init(source: DraggableProtocol, padHandler: @escaping (_ panGestureRecognizer: UIPanGestureRecognizer) -> Void) {
        self.source = source
        self.panHandler = padHandler
    }
    
    @objc func pan(_ sender: UIPanGestureRecognizer) {
        panHandler(sender)
    }
    
}
