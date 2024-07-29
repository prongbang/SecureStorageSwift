//
//  KeychainManager.swift
//
//
//  Created by DARRAN on 29/7/2567 BE.
//

import Foundation

public class LocalKeychainManager : KeychainManager {
    
    public init() {}
    
    public func query(key: String?, config: KeychainConfig) -> Dictionary<CFString, Any> {
        var keychainQuery: [CFString: Any] = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrAccessible : config.accessibility.toSecAttr(),
        ]
        
        if (key != nil) {
            keychainQuery[kSecAttrAccount] = key
        }
        if (config.returnData != nil) {
            keychainQuery[kSecReturnData] = config.returnData
        }
        if (config.serviceName != nil) {
            keychainQuery[kSecAttrService] = config.serviceName
        }
        if (config.accessGroup != nil) {
            keychainQuery[kSecAttrAccessGroup] = config.accessGroup
        }
        if (config.synchronizable != nil) {
            keychainQuery[kSecAttrSynchronizable] = config.synchronizable
        }
        
        return keychainQuery
    }
    
}
