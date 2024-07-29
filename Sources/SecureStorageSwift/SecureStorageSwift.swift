//
//  SecureStorageSwift.swift
//
//
//  Created by DARRAN on 29/7/2567 BE.
//

import Foundation

public protocol SecureStorageSwift {
    func containsKey(key: String) -> Bool
    func read(key: String) -> String?
    func readAll() -> [String: String]?
    func delete(key: String) -> Bool
    func deleteAll() -> Bool
    func write(key: String, value: String) -> Bool
}
