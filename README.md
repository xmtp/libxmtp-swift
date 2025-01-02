# LibXMTP Swift

Swift Package and Cocoapod that wraps an XCFramework emitted by the `bindings_ffi` crate in [libxmtp](https://github.com/xmtp/libxmtp)


## Usage

**NOTE**: This package is NOT meant to be directly consumed by end users. Instead see [xmtp-ios](https://github.com/xmtp/xmtp-ios) which depends upon this package.

## Process for updating from a [libxmtp](https://github.com/xmtp/libxmtp) Swift Binding Release (work in progress!)

1. From [libxmtp](https://github.com/xmtp/libxmtp) repo, go to Action => Release Swift Bindings => Run workflow (select branch to release from)
2. Verify success in [libxmtp releases](https://github.com/xmtp/libxmtp/releases)
3. Create a new branch in the `libxmtp-swift` repo
4. With `libxmtp` repo and `libxmtp-swift` (this repo) cloned locally in sibling directories, and `libxmtp` checked out to the correct release commit, run the script (this should update `libxmtp-swift/Sources` directory):
   ```
   bindings_ffi/run_swift_local.sh
   ```
5. Update `LibXMTP.podspec` version, and then point `s.source` url to `LibXMTPSwiftFFI.zip` from the libxmtp release you created (verify the podspec is correct using the command `pod spec lint LibXMTP.podspec`) 
6. Update `Package.swift` binary target url to point to the same `LibXMTPSwiftFFI.zip` from the step above
7. Update the `Package.swift` checksum to the checksum from the from the libxmtp release you created
8. Create a PR and merge to `libxmtp-swift` main branch
9. Tag your commit on main using the  value of the `s.version` from the `LibXMTP.podspec` that you bumped earlier  in step 5. => This will also trigger the cocoapod publish (see [deploy_to_cocoapods.yml](https://github.com/xmtp/libxmtp-swift/blob/main/.github/workflows/deploy_to_cocoapods.yml) for more details)

You should now be able to reference the Swift Package and Cocoapod from xmtp-ios using the format below.

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
