//
//  NSString+Size.swift
//  ShoppingMall
//
//  Created by SimonWong on 2019/3/1.
//  Copyright © 2019 Guangzhou Tanghe Information Technology Co., Ltd. All rights reserved.
//

extension String {
    
    func calculateHeight(font: UIFont?, constrainedToWidth width: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGFloat {
        let font = font != nil ? font : UIFont.systemFont(ofSize: UIFont.systemFontSize)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        let attributes = [NSAttributedString.Key.font: font as Any, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let options = NSStringDrawingOptions(rawValue: NSStringDrawingOptions.usesLineFragmentOrigin.rawValue | NSStringDrawingOptions.truncatesLastVisibleLine.rawValue)
        let size = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: options, attributes: attributes, context: nil).size
        return size.height.rounded(.up)
    }
    
    func calculateWidth(font: UIFont?, constrainedToHeight height: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGFloat {
        let font = font != nil ? font : UIFont.systemFont(ofSize: UIFont.systemFontSize)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        let attributes = [NSAttributedString.Key.font: font as Any, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let options = NSStringDrawingOptions(rawValue: NSStringDrawingOptions.usesLineFragmentOrigin.rawValue | NSStringDrawingOptions.truncatesLastVisibleLine.rawValue)
        let size = NSString(string: self).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: height), options: options, attributes: attributes, context: nil).size
        return size.width.rounded(.up)
    }
    
    func calculateSize(font: UIFont?, constrainedToWidth width: CGFloat) -> CGSize {
        let font = font != nil ? font : UIFont.systemFont(ofSize: UIFont.systemFontSize)
        var width = width
        if width <= 0 {
            width = CGFloat.greatestFiniteMagnitude
        }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        let attributes = [NSAttributedString.Key.font: font as Any, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let options = NSStringDrawingOptions(rawValue: NSStringDrawingOptions.usesLineFragmentOrigin.rawValue | NSStringDrawingOptions.truncatesLastVisibleLine.rawValue)
        let size = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: options, attributes: attributes, context: nil).size
        return CGSize(width: size.width.rounded(.up), height: size.height.rounded(.up))
    }
    
    func calculateSize(font: UIFont?, constrainedToHeight height: CGFloat) -> CGSize {
        let font = font != nil ? font : UIFont.systemFont(ofSize: UIFont.systemFontSize)
        var height = height
        if height <= 0 {
            height = CGFloat.greatestFiniteMagnitude
        }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        let attributes = [NSAttributedString.Key.font: font as Any, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let options = NSStringDrawingOptions(rawValue: NSStringDrawingOptions.usesLineFragmentOrigin.rawValue | NSStringDrawingOptions.truncatesLastVisibleLine.rawValue)
        let size = NSString(string: self).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: height), options: options, attributes: attributes, context: nil).size
        return CGSize(width: size.width.rounded(.up), height: size.height.rounded(.up))
    }
    
}
