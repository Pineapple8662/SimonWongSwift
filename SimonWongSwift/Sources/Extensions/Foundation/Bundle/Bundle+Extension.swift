//
//  Bundle+Extension.swift
//  HeteClient
//
//  Created by 赫特 on 2021/5/19.
//  Copyright © 2021 Hot Beauty, Inc. All rights reserved.
//

import Foundation

extension Bundle {
    
    /// Bundle name 应用名
    static let name = main.object(forInfoDictionaryKey: "CFBundleName") ?? ""
    /// Bundle identifier
    static let identifier = main.object(forInfoDictionaryKey: "CFBundleIdentifier") ?? ""
    /// Short version string 版本号
    static let shortVersionString = main.object(forInfoDictionaryKey: "CFBundleShortVersionString") ?? ""
    /// Version string, Build号
    static let version = main.object(forInfoDictionaryKey: "CFBundleVersion") ?? ""
    
}
