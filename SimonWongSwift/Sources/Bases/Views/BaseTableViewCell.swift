//
//  BaseTableViewCell.swift
//  SimonWongSwift
//
//  Created by SimonWong on 2021/4/14.
//  Copyright © 2021 SimonWong. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell, ReuseIdentifierProtocol {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBaseSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureBaseSubviews()
    }
    
    private func configureBaseSubviews() {
        if self.isMember(of: Self.self) {
            selectionStyle = .default
        }
        textLabel?.textColor = .darkText
        textLabel?.font = .mediumSystemFont(ofSize: 16)
        detailTextLabel?.textColor = .lightText
        detailTextLabel?.font = .mediumSystemFont(ofSize: 14)
    }
    
}
