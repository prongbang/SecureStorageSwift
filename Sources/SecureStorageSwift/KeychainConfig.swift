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
    
    public init(
        accessGroup: String?,
        serviceName: String?,
        synchronizable: Bool?,
        accessibility: KeychainAccessibility,
        returnData: Bool?
    ) {
        self.accessGroup = accessGroup
        self.serviceName = serviceName
        self.synchronizable = synchronizable
        self.accessibility = accessibility
        self.returnData = returnData
    }
}
