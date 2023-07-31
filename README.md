# LibXMTP Swift

Swift Package and Cocoapod that wraps an XCFramework emitted by the `bindings_ffi` crate in [libxmtp](https://github.com/xmtp/libxmtp)


## Usage

**NOTE**: This package is NOT meant to be directly consumed by end users. Instead see [xmtp-ios](https://github.com/xmtp/xmtp-ios) which depends upon this package.


### For testing purposes

Reference in Package.swift:
```
...
.package(url: "https://github.com/xmtp/libxmtp-swift", from: "0.0.1-beta0")
...
```
Reference in Podspec:
```
...
spec.dependency 'LibXMTP', '= 0.0.1-beta0'
...
```

## Diagram

```
┌────────────────────────────────────┬─────────────────────────────┬─────────────────────────────────┐
│                                    │                             │                                 │
│  xmtp/libxmtp: Shared Rust Code    │  xmtp/libxmtp-swift         │ xmtp/xmtp-ios - iOS SDK         │
│    - xmtp-networking               │  - Git repo to host Swift   │ - Existing iOS xmtp SDK         │
│    - xmtp-proto                    │  Package                    │ - Consumes libxmtp-swift as     │
│    |                               │  - Also contains Podspec    │ a Cocoapod via spec.dependency  │
│    ---> bindings_swift             │  for LibXMTP pod            │                                 │
│                                    │    ┌──────────────────────┐ │                                 │
│ ┌──────────┐     ┌───────────────┐ │ ┌─►│-Package.swift        │ │                                 │
│ │xmtp-proto├────►│xmtp-networking│ │ │  │-LibXMTPRust.xcfra... │ │    ┌──────────────────┐         │
│ └──────────┘     └─────┬─────────┘ │ │  │-Sources/...          │ │    │ XMTP.podspec     │         │
│                        │           │ │  │ - [Generated files]  │ │    │ Package.swift    │         │
│        ┌───────────────▼────┐      │ │  └─────────┬────────────┘ │ ┌──► -                │         │
│        │libxmtp/            │      │ │            │  Swift Pkg   │ │  │ import LibXMTP   │         │
│        │  bindings_ffi      │      │ │            └──────────────┼─┘  │                  │         │
│        │   w/ uniffi        │      │ │               Github url  │    └────────┬─────────┘         │
│        └──────────┬─────────┘      │ ├────────┐      or Cocoapod │             │                   │
│                   │                │ │filecopy│                  ├─────────────▼───────────────────┤
│           Output: │                │ ├────────┘                  │xmtp/xmtp-react-native           │
│  ┌────────────────▼─────────┐      │ │                           │ - consumes xmtp/xmtp-ios        │
│  │ LibXMTPRust.xcframework  ├──────┼─┘                           │ as a Cocoapod                   │
│  └──────────────────────────┘      │                             │                                 │
│                                    │                             │                                 │
└────────────────────────────────────┴─────────────────────────────┴─────────────────────────────────┘
```