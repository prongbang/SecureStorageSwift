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
    .package(url: "https://github.com/prongbang/SecureStorageSwift.git", from: "1.0.4"),
  ],
)
```

## How to use

### Initialize

```swift
import SecureStorageSwift

let config = KeychainConfig(
    accessGroup: nil,
    serviceName: "SecureStorage",
    synchronizable: false,
    accessibility: .unlocked,
    returnData: nil
)
let keychainManager = LocalKeychainManager()
let secureStorage = LocalSecureStorageSwift(config: config, keychainManager: keychainManager)
```

### Contains Key

```swift
let exist = secureStorage.containsKey(key: "key")
```


### Read

```swift
let value = secureStorage.read(key: "key")
```


### Read All

```swift
let results = secureStorage.readAll()
```


### Delete

```swift
let result = secureStorage.delete(key: "key")
```


### Delete All

```swift
let result = secureStorage.deleteAll()
```


### Read

```swift
let result = secureStorage.write(key: "key")
```
