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
            targets: ["LibXMTP", "LibXMTPSwiftFFI"]
        ),
    ],
    targets: [
        .target(
            name: "LibXMTP",
            dependencies: ["LibXMTPSwiftFFI"],
            path: "Sources/LibXMTP"
        ),
        .binaryTarget(
            name: "LibXMTPSwiftFFI",
            url: "https://github.com/xmtp/libxmtp/releases/download/swift-bindings-308ed57/LibXMTPSwiftFFI.zip",
            checksum: "61e139006925ca075f838dd6cc1be00268081882d6e64bbb103b344dbc2741bb"
        ),
        .testTarget(name: "LibXMTPTests", dependencies: ["LibXMTP"]),
    ]
)
