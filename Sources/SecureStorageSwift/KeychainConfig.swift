//
//  KeychainConfig.swift
//
//  Created by DARRAN on 29/7/2567 BE.
//

import Foundation

public struct KeychainConfig {
    var accessGroup: String?
    var serviceName: String?
    var synchronizable: Bool?
    var accessibility: KeychainAccessibility
    var returnData: Bool? = nil
}
