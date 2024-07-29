//
//  KeychainAccessibility.swift
//  
//
//  Created by DARRAN on 29/7/2567 BE.
//

import Foundation

public enum KeychainAccessibility {
    case passcode
    case unlocked
    case unlockedThisDeviceOnly
    case unlockedFirst
    case unlockedFirstThisDeviceOnly
}

// How to use:
// let accessibility = KeychainAccessibility.unlocked
// let secAttr = accessibility.toSecAttr()
public extension KeychainAccessibility {
    func toSecAttr() -> CFString {
        switch self {
        case .passcode:
            return kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly
        case .unlocked:
            return kSecAttrAccessibleWhenUnlocked
        case .unlockedThisDeviceOnly:
            return kSecAttrAccessibleWhenUnlockedThisDeviceOnly
        case .unlockedFirst:
            return kSecAttrAccessibleAfterFirstUnlock
        case .unlockedFirstThisDeviceOnly:
            return kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
        }
    }
}
