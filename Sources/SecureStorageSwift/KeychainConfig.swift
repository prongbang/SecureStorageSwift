//
//  KeychainConfig.swift
//
//  Created by DARRAN on 29/7/2567 BE.
//

import Foundation

public struct KeychainConfig {
    public var accessGroup: String?
    public var serviceName: String?
    public var synchronizable: Bool?
    public var accessibility: KeychainAccessibility
    public var returnData: Bool? = nil
}
