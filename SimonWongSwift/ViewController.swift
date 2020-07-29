//
//  ViewController.swift
//  SimonWongSwift
//
//  Created by Admin on 2020/7/24.
//  Copyright © 2020 SimonWong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UILabel(text: <#T##String#>, textColor: <#T##UIColor#>, font: <#T##UIFont#>, isSizeToFit: <#T##Bool#>)
        
    }

}


extension UILabel {
    
    convenience init(text: String, textColor: UIColor, font: UIFont, isSizeToFit isFit: Bool) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = font
        if isFit {
            self.sizeToFit()
        }
    }
    
}
