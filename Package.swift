// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LibXMTP",
    platforms: [
        .iOS(.v13),
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "LibXMTP",
            type: .static,
            targets: ["LibXMTP", "LibXMTPSwiftFFI"]
        ),
        .library(
            name: "LibXMTP"
            type: .dynamic
            targets: ["LibXMTPDynamic"]
        )
    ],
    targets: [
        .target(
            name: "LibXMTP",
            dependencies: ["LibXMTPSwiftFFI"],
            path: "Sources/LibXMTP",
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("SystemConfiguration")
            ]
        ),
        .binaryTarget(
            name: "LibXMTPSwiftFFI",
            url: "https://github.com/xmtp/libxmtp/releases/download/swift-bindings-1.4.0.a9d19aa/LibXMTPSwiftFFI.zip",
            checksum: "a4bcf78ced5f4dd80c161a17a498bac508a30b59f72dfba9c5318020528ccc0e"
        ),
        .target(
            name: "LibXMTPDynamic",
            dependencies: ["LibXMTPSwiftFFIDynamic"],
            path: "Sources/LibXMTP",
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("SystemConfiguration")
            ]
        ),
        .binaryTarget(
            name: "LibXMTPSwiftFFIDynamic",
            url: "https://github.com/xmtp/libxmtp/releases/download/swift-bindings-1.4.0.a9d19aa/LibXMTPSwiftFFIDynamic.zip",
            checksum: "0000000000000000000000000000000000000000000000000000000000000000"
        ),
        .testTarget(name: "LibXMTPTests", dependencies: ["LibXMTP"]),
    ]
)
