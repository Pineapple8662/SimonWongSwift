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
        backgroundColor = .dynamicColor(.white, .hex_323232)
        if self.isMember(of: Self.self) {
            selectionStyle = .default
        }
        textLabel?.textColor = .darkText
        textLabel?.font = .systemFont(ofSize: 16)
        detailTextLabel?.textColor = .lightText
        detailTextLabel?.font = .systemFont(ofSize: 14)
    }
    
}
