//
//  KeychainManager.swift
//
//  Created by DARRAN on 29/7/2567 BE.
//

import Foundation

public protocol KeychainManager {
    func query(key: String?, config: KeychainConfig) -> Dictionary<CFString, Any>
}
