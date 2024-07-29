// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import Security

public class LocalSecureStorageSwift : SecureStorageSwift {
    
    private let config: KeychainConfig
    private let keychainManager: KeychainManager
    
    public init(config: KeychainConfig, keychainManager: KeychainManager) {
        self.config = config
        self.keychainManager = keychainManager
    }
    
    public init() {
        self.config = KeychainConfig(
            accessGroup: "com.inteniquetic.kSecKey",
            serviceName: "SecStoreService",
            synchronizable: true,
            accessibility: .unlocked
        )
        self.keychainManager = LocalKeychainManager()
    }
    
    public func containsKey(key: String) -> Bool {
        let query = keychainManager.query(key: key, config: KeychainConfig(
            accessGroup: config.accessGroup,
            serviceName: config.serviceName,
            synchronizable: config.synchronizable,
            accessibility: config.accessibility,
            returnData: false
        ))
        
        let status = SecItemCopyMatching(query as CFDictionary, nil)
        switch status {
        case errSecSuccess:
            return true
        case errSecItemNotFound:
            return false
        default:
            return false
        }
    }
    
    public func read(key: String) -> String? {
        let query = keychainManager.query(key: key, config: KeychainConfig(
            accessGroup: config.accessGroup,
            serviceName: config.serviceName,
            synchronizable: config.synchronizable,
            accessibility: config.accessibility,
            returnData: true
        ))
        
        var ref: AnyObject?
        var value: String? = nil
        
        let status = SecItemCopyMatching(query as CFDictionary, &ref)
        if (status == errSecItemNotFound) {
            return nil
        }
        
        if (status == noErr) {
            value = String(data: ref as! Data, encoding: .utf8)
        }
        
        return value
    }
    
    public func readAll() -> [String: String]? {
        var query = keychainManager.query(key: nil, config: KeychainConfig(
            accessGroup: config.accessGroup,
            serviceName: config.serviceName,
            synchronizable: config.synchronizable,
            accessibility: config.accessibility,
            returnData: true
        ))
        query[kSecMatchLimit] = kSecMatchLimitAll
        query[kSecReturnAttributes] = true
        
        var ref: AnyObject?
        var results: [String: String] = [:]
        
        let status = SecItemCopyMatching(query as CFDictionary, &ref)
        if (status == errSecItemNotFound) {
            return nil
        }
        
        if (status == noErr) {
            (ref as! NSArray).forEach { item in
                let key: String = (item as! NSDictionary)[kSecAttrAccount] as! String
                let value: String = String(data: (item as! NSDictionary)[kSecValueData] as! Data, encoding: .utf8) ?? ""
                results[key] = value
            }
        }
        
        return results
    }
    
    public func delete(key: String) -> Bool {
        let query = keychainManager.query(key: key, config: KeychainConfig(
            accessGroup: config.accessGroup,
            serviceName: config.serviceName,
            synchronizable: config.synchronizable,
            accessibility: config.accessibility,
            returnData: true
        ))
        
        let status = SecItemDelete(query as CFDictionary)
        if (status == errSecItemNotFound) {
            return false
        }
        
        return status == noErr
    }
    
    public func deleteAll() -> Bool {
        let query = keychainManager.query(key: nil, config: KeychainConfig(
            accessGroup: config.accessGroup,
            serviceName: config.serviceName,
            synchronizable: config.synchronizable,
            accessibility: config.accessibility,
            returnData: nil
        ))
        
        let status = SecItemDelete(query as CFDictionary)
        if (status == errSecItemNotFound) {
            return false
        }
        
        return status == noErr
    }
    
    public func write(key: String, value: String, accessibility: KeychainAccessibility = KeychainAccessibility.unlocked) -> Bool {
        var query = keychainManager.query(key: key, config: KeychainConfig(
            accessGroup: config.accessGroup,
            serviceName: config.serviceName,
            synchronizable: config.synchronizable,
            accessibility: config.accessibility,
            returnData: nil
        ))
        
        let keyExists = self.containsKey(key: key)
        if (keyExists) {
            let update: [CFString: Any?] = [
                kSecValueData: value.data(using: String.Encoding.utf8),
                kSecAttrAccessible: accessibility.toSecAttr(),
                kSecAttrSynchronizable: config.synchronizable
            ]
            let status = SecItemUpdate(query as CFDictionary, update as CFDictionary)
            
            return status == noErr
        } else {
            query[kSecValueData] = value.data(using: String.Encoding.utf8)
            let status = SecItemAdd(query as CFDictionary, nil)
            
            return status == noErr
        }
    }
    
}
