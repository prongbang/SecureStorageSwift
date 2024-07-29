# SecureStorageSwift

Secure Storage Swift provides an API to securely store sensitive data.

## CocoaPods

```shell
pod 'SecureStorageSwift'
```

## Swift Package Manager

In your `Package.swift` file, add `SecureStorageSwift` dependency to corresponding targets:

```swift
let package = Package(
  dependencies: [
    .package(url: "https://github.com/prongbang/SecureStorageSwift.git", from: "1.0.0"),
  ],
)
```

## How to use

### Initialize

```swift
import SecureStorageSwift

let keyConfig = KeyConfig(name: "com.prongbang.signx.kSecAccKey")
let signatureBiometricManager = LocalSignatureBiometricManager.newInstance(
    keyConfig: keyConfig
)
```
