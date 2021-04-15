//
//  DraggableMaskView.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2021/4/16.
//  Copyright © 2021 SimonWong. All rights reserved.
//

import UIKit

class DraggableMaskView: UIView {
    
//    BOOL endDrag; // indicates scrollviewB did finish
//    BOOL shouldClearHitTest; // bool to help calling the method clearHitTest only once.
//    BOOL multiTouch; // needed for the method clearHitTest to know if a multi-touch is detected or not
//    NSMutableArray *events; // store all events within one eventloop/touch;
    
    var endDrag = false
    var shouldClearHitTest = false
    var multiTouch = false
    var events: [UIEvent] = []
    
    var flag = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        if !endDrag {
//            if !shouldClearHitTest {
//                shouldClearHitTest = true
//                RunLoop.main.perform(#selector(clearHitTest), target: self, argument: nil, order: 1, modes: [.common])
//            }
//            if let event = event {
//                events.append(event)
//                if event.type == .touches {
//                    return self
//                }
//            }
//        } else {
//            endDrag = false
//        }
        
//        print("event: \(event)")
//        return self
        
        
        let hitView = super.hitTest(point, with: event)
            flag = !flag
        if flag {
            hitTest(point, with: event)
            return hitView
        }
        if (hitView == self) {
            return nil
        }
        return hitView
    }
    
    
    
    @objc private func clearHitTest() {        if shouldClearHitTest {
            shouldClearHitTest = false
            events.removeAll()
            print("current function: \(self), \(#function)")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("current function: \(self), \(#function)")
    }
    
//    - (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//        if (!endDrag) {
//            if (!shouldClearHitTest) { // as hitTest will be called multible times in one event-loop and i need all events, i will clean the temporaries when everything is done
//                shouldClearHitTest = YES;
//                [[NSRunLoop mainRunLoop] performSelector:@selector(clearHitTest) target:self argument:nil order:1 modes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
//            }
//            [events addObject:event]; // store the events so i can access them after all hittests for one touch are evaluated
//
//            if (event.type == UIEventTypeTouches && ([_events count] > 3 || [[event allTouches] count] > 0 || _currentEvent)) { // two or more fingers detected. at least for my view hierarchy
//                multiTouch = YES;
//                return scrollViewB;
//            }
//        }else {
//            endDrag = NO;
//        }
//        return scrollViewA;
//    }
//
//    - (void)clearHitTest {
//        if (shouldClearHitTest) {
//            shouldClearHitTest = NO;
//            [events removeAllObjects];
//            if (multiTouch) {
//               // Do some special stuff for multiTouch
//            }
//            multiTouch = NO;
//        }
//    }

}
